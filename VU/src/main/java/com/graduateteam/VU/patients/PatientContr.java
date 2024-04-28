package com.graduateteam.VU.patients;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/patient")
public class PatientContr {
    @Autowired
    private PatientService patientService;

    @GetMapping("/personal-info/{id}")
    public Patient getPatient(@PathVariable String id){
        return patientService.getPatient(id);
    }
    @GetMapping("/beds/{id}")
    public List<PatientProjection> getPatients(@PathVariable int id){
        return patientService.getPatients(id);
    }
}
