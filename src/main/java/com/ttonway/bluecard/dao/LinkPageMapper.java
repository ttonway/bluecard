package com.ttonway.bluecard.dao;

import com.ttonway.bluecard.pojo.LinkPage;

import java.util.List;

public interface LinkPageMapper {

    LinkPage queryLinkByKey(String key);

    List<LinkPage> queryAllLink();

    int insertLink(LinkPage linkPage);

    int updateLink(LinkPage linkPage);
}