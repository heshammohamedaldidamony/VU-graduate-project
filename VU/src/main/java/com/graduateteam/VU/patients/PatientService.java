package com.graduateteam.VU.patients;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientService {
    @Autowired
    private PatientRepo patientRepo;

    public Patient getPatient(String id) {
        return patientRepo.findById(id);
    }

    public List<PatientProjection> getPatients(int id) {
        return patientRepo.findAllByUnitId(id);
    }
}
