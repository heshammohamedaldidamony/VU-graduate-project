package com.graduateteam.VU.patients;

import com.graduateteam.VU.login.User;
import com.graduateteam.VU.units.Shift;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/patient")
public class PatientContr {
    @Autowired
    private PatientService patientService;

    @GetMapping("/personal-info")
    public Patient getPatient(@RequestBody String id){
        return patientService.getPatient(id);
    }
}
