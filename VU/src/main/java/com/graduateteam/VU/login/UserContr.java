package com.graduateteam.VU.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserContr {
    @Autowired
    private UserService userService;

    @PostMapping("/exist")
    public boolean checkUserExist(@RequestBody User user){
        return userService.checkUserExist(user);
    }
}
