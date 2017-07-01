package com.ttonway.bluecard.service;

import com.ttonway.bluecard.pojo.LinkPage;

import java.util.List;

public interface LinkPageService {

    LinkPage queryLinkByKey(String key);

    List<LinkPage> queryAllLink();

    int insertLink(LinkPage linkPage);

    int updateLink(LinkPage linkPage);
}