package com.ttonway.bluecard.dao;

import com.ttonway.bluecard.pojo.Organization;

import java.util.List;
import java.util.Map;

public interface OrganizationMapper {

    List<Organization> queryOrgList(Map<String, Integer> map);

    int queryOrgListCount();

    int insertOrg(Organization org);

    int deleteOrgs(Long[] orgIds);
}