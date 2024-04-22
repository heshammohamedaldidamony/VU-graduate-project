package com.graduateteam.VU.patients;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface PatientRepo extends JpaRepository<Patient,Integer> {
    public Patient findById(String id);
}
