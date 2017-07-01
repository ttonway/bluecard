package com.ttonway.bluecard.auth;

import com.ttonway.bluecard.pojo.AdminUser;
import com.ttonway.bluecard.pojo.AdminUserDetails;
import com.ttonway.bluecard.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ttonway on 2017/6/8.
 */
public class UserServiceImpl implements UserDetailsService {

    @Autowired
    private AdminUserService adminUserService;

    @Override
    public UserDetails loadUserByUsername(String username) {
        AdminUser adminUser = adminUserService.queryUserByCode(username);
        if (adminUser == null) {
            throw new UsernameNotFoundException(username + "Not Found");
        } else {
            List<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
            auths.add(new SimpleGrantedAuthority(adminUser.getRole()));

            AdminUserDetails user = new AdminUserDetails(adminUser.getUserCode(), adminUser.getPassword(), true, true, true, true, auths);
            user.setAdminUser(adminUser);
            return user;
        }
    }
}
