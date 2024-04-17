package com.graduateteam.VU.shift;

import com.graduateteam.VU.login.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/shift")
public class ShiftContr {
    @Autowired
    private ShiftService shiftService;

    @PostMapping()
    public Shift getShift(@RequestBody User user){
        return shiftService.getShift(user);
    }



}
