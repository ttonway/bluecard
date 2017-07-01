package com.ttonway.bluecard.service.impl;

import com.ttonway.bluecard.dao.OrganizationMapper;
import com.ttonway.bluecard.pojo.Organization;
import com.ttonway.bluecard.service.OrganizationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service
public class OrganizationServiceImpl implements OrganizationService {

    @Resource
    private OrganizationMapper organizationMapper;

    @Override
    public List<Organization> queryOrgList(Map<String, Integer> map) {
        return organizationMapper.queryOrgList(map);
    }

    @Override
    public int queryOrgListCount() {
        return organizationMapper.queryOrgListCount();
    }

    @Override
    public int insertOrg(Organization org) {
        return organizationMapper.insertOrg(org);
    }

    @Override
    public int deleteOrgs(Long[] orgIds) {
        return organizationMapper.deleteOrgs(orgIds);
    }
}
