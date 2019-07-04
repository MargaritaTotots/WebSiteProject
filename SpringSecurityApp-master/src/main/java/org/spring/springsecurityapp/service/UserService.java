package org.spring.springsecurityapp.service;

import org.spring.springsecurityapp.model.User;

import java.util.List;


public interface UserService {

    void save(User user);

    User findByUsername(String username);

    List<User> listUsers();
}
