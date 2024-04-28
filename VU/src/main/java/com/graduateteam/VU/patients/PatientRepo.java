package com.graduateteam.VU.patients;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface PatientRepo extends CrudRepository<Patient,Integer> {
    public Patient findById(String id);

    @Query("SELECT patient.id_patient , patient.name FROM vu1.patient\n" +
            "join device on patient.id_patient = device.id_patient\n" +
            "join unit on device.id_unit = unit.id_unit\n" +
            "where unit.id_unit=:id")
    public List<PatientProjection> findAllByUnitId(int id);
}
