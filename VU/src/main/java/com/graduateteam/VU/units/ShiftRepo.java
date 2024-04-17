package com.graduateteam.VU.units;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShiftRepo extends CrudRepository<Shift,Unit > {

    @Query("select id_doctor from doctor_phone where phone=:phone")
    public String getDoctorIdByPhone(String phone);
    @Query("select id_nurse from nurse_phone where phone=:phone")
    public String getNurseIdByPhone(String phone);

    @Query("select unit.id_unit as id , unit.name , doctor_shift.start , doctor_shift.end from unit\n" +
            "join doctor_shift_unit on unit.id_unit= doctor_shift_unit.id_unit \n" +
            "join doctor_shift on doctor_shift.id_shiftdoctor = doctor_shift_unit.id_shiftdoctor  \n" +
            "where doctor_shift_unit.id_doctor=:id")
    public List<UnitDoctor> getShiftUnitsByDoctorId(String id);
    @Query("select  unit.id_unit as id,unit.name ,doctor.name as doctor from nurse_shift_patient\n" +
            "            join patient on patient.id_patient=nurse_shift_patient.id_patient\n" +
            "            join device on device.id_patient=patient.id_patient\n" +
            "            join unit on unit.id_unit=device.id_device\n" +
            "            join doctor_shift_unit on unit.id_unit = doctor_shift_unit.id_unit\n" +
            "            join doctor_shift on doctor_shift.id_shiftdoctor =  doctor_shift_unit.id_shiftdoctor\n" +
            "            join doctor on doctor.id_doctor = doctor_shift_unit.id_doctor\n" +
            "            WHERE doctor_shift.start <= NOW() AND doctor_shift.end >= NOW() && id_nurse=:id")
    public List<UnitNurse> getShiftUnitsByNurseId(String id);

    @Query("select icu.name  , doctor.name as consultant from unit\n" +
            "join icu on icu.id_icu=unit.id_icu\n" +
            "join doctor on doctor.id_doctor=icu.id_doctor\n" +
            "where unit.id_unit=:id")
    public Icu getIcuByUnitId(int id);

}
