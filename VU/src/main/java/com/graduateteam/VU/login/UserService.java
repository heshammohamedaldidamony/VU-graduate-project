package com.graduateteam.VU.login;

import com.graduateteam.VU.login.User;
import com.graduateteam.VU.login.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepo userRepo;


    public boolean checkUserExist(User user) {
        if(user.getRole().equals("doctor"))
       return userRepo.countDoctorByPhone(user.getPhone())>0;
        else
            return userRepo.countNurseByPhone(user.getPhone())>0;
    }
}
