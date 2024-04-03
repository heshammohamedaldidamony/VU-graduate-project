package com.graduateteam.VU.shift;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface ShiftRepo extends CrudRepository<Shift,Unit > {

    @Query("select id_doctor from doctor_phone where phone=:phone")
    public String getDoctorIdByPhone(String phone);

    @Query("select unit.id_unit as id , unit.name , doctor_shift.start , doctor_shift.end from unit\n" +
            "join doctor_shift_unit on unit.id_unit= doctor_shift_unit.id_unit \n" +
            "join doctor_shift on doctor_shift.id_shiftdoctor = doctor_shift_unit.id_shiftdoctor  \n" +
            "where doctor_shift_unit.id_doctor=:id")
    public ArrayList<Unit> getShiftUnitsByDoctorId(String id);

    @Query("select icu.name as icuName , doctor.name as consultantDoctor from unit\n" +
            "join icu on icu.id_icu=unit.id_icu\n" +
            "join doctor on doctor.id_doctor=icu.id_doctor\n" +
            "where unit.id_unit=:id")
    public Icu getIcuByUnitId(int id);

    @Query("select icu.name as icuName from unit \n"+
            "join icu on icu.id_icu=unit.id_icu\n" +
            "where unit.id_unit=:id")
    String getIcuNameByUnitId(int id);

    @Query("select vu1.doctor.name from vu1.doctor\n" +
            "join vu1.icu on vu1.doctor.id_doctor = vu1.icu.id_doctor\n" +
            "where vu1.icu.id_icu=:id")
    String getConsultantDrByUnitId(int id);
}
