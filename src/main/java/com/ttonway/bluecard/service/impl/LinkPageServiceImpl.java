package com.ttonway.bluecard.service.impl;

import com.ttonway.bluecard.dao.LinkPageMapper;
import com.ttonway.bluecard.pojo.LinkPage;
import com.ttonway.bluecard.service.LinkPageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class LinkPageServiceImpl implements LinkPageService {

    @Resource
    private LinkPageMapper linkPageMapper;

    @Override
    public LinkPage queryLinkByKey(String key) {
        return linkPageMapper.queryLinkByKey(key);
    }

    @Override
    public List<LinkPage> queryAllLink() {
        return linkPageMapper.queryAllLink();
    }

    @Override
    public int insertLink(LinkPage linkPage) {
        return linkPageMapper.insertLink(linkPage);
    }

    @Override
    public int updateLink(LinkPage linkPage) {
        return linkPageMapper.updateLink(linkPage);
    }
}
