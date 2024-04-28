package com.graduateteam.VU.patients;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface PatientRepo extends CrudRepository<Patient,Integer> {
    public Patient findById(String id);
}
