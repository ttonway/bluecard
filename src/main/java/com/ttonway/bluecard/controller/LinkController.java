package com.ttonway.bluecard.controller;

import com.ttonway.bluecard.pojo.LinkPage;
import com.ttonway.bluecard.service.LinkPageService;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

@Controller
@RequestMapping("/link")
public class LinkController {
    private static Logger logger = Logger.getLogger(LinkController.class);

    public static final Map<String, String> LINK_NAME_MAP;

    static {
        Map<String, String> map = new LinkedHashMap<>();
        map.put("car", "0元洗车");
        map.put("movie", "9元观影");
        map.put("gasoline", "加油返现");
        map.put("dessert", "半价甜点");
        map.put("yxtravel", "悦享旅游");
        map.put("yxcar", "悦享车生活");
        map.put("yxshopping", "悦享买买买");
        LINK_NAME_MAP = Collections.unmodifiableMap(map);
    }

    @Value("${fileserver.path}")
    private String fileRootPath;

    @Autowired
    private LinkPageService linkPageService;

    @RequestMapping("/table")
    public ModelAndView table() {
        ModelAndView model = new ModelAndView("linkgrid");
        model.addObject("linkList", linkPageService.queryAllLink());
        return model;
    }

    @RequestMapping("/create")
    public ModelAndView create() {
        ModelAndView model = new ModelAndView("linkcreate");
        model.addObject("keyNameMap", LINK_NAME_MAP);
        return model;
    }

    @Transactional
    @RequestMapping("/save")
    public ModelAndView save(String key, @RequestParam MultipartFile file, String text) {
        ModelAndView model = new ModelAndView("linkcreate");
        model.addObject("keyNameMap", LINK_NAME_MAP);

        if (!LINK_NAME_MAP.containsKey(key)) {
            model.addObject("error", "请选择类型");
            return model;
        }
        if (file.isEmpty()) {
            model.addObject("error", "请选择图片");
            return model;
        }

        try {
            UUID uuid = UUID.randomUUID();
            File target = new File(fileRootPath, uuid.toString());
            file.transferTo(target);

            LinkPage linkPage = linkPageService.queryLinkByKey(key);
            if (linkPage == null) {
                linkPage = new LinkPage();
                linkPage.setKey(key);
                linkPage.setName(LINK_NAME_MAP.get(key));
                linkPage.setImageFile(target.getName());
                linkPage.setImageContentType(file.getContentType());
                linkPage.setText(text);
                linkPageService.insertLink(linkPage);
            } else {
                linkPage.setImageFile(target.getName());
                linkPage.setImageContentType(file.getContentType());
                linkPage.setText(text);
                linkPageService.updateLink(linkPage);
            }

            return new ModelAndView("redirect:table");
        } catch (Exception e) {
            logger.error("save link page fail.", e);
            model.addObject("error", e.getLocalizedMessage());
            return model;
        }
    }


    @RequestMapping(value = "/image/{key}")
    public void image(HttpServletResponse response, @PathVariable String key) throws IOException {

        LinkPage linkPage = linkPageService.queryLinkByKey(key);
        if (linkPage == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        response.setContentType(MediaType.IMAGE_JPEG_VALUE);

        File file = new File(fileRootPath, linkPage.getImageFile());
        logger.debug("read file " + file);
        FileInputStream fis = null;
        try {
            OutputStream out = response.getOutputStream();
            fis = new FileInputStream(file);
            byte[] buffer = new byte[1024];
            int length;
            while ((length = fis.read(buffer)) != -1) {
                out.write(buffer, 0, length);
            }
            out.flush();
        } catch (FileNotFoundException e) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            logger.error("read " + file + " fail.", e);
        } finally {
            IOUtils.closeQuietly(fis);
        }
    }


    @RequestMapping(value = "/page/{key}")
    public ModelAndView page(@PathVariable String key) throws IOException {
        LinkPage linkPage = linkPageService.queryLinkByKey(key);

        ModelAndView model = new ModelAndView("linkpage");
        model.addObject("linkPage", linkPage);
        return model;
    }
}
