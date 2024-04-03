package com.graduateteam.VU.shift;

import com.graduateteam.VU.exception_handling.OutIndexException;
import com.graduateteam.VU.login.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ShiftService {
    @Autowired
    private ShiftRepo shiftRepo;


    public Shift getShift(User user) {
            String doctorId = shiftRepo.getDoctorIdByPhone(user.getPhone());
            ArrayList<Unit> units= shiftRepo.getShiftUnitsByDoctorId(doctorId);
            //Icu icu =shiftRepo.getIcuByUnitId(1);
            // i checked if icu is null . but it isnt . it refers to an object with null values;

        if(units.isEmpty()){
            throw  new OutIndexException("out index exception");
        }
            String icuName=shiftRepo.getIcuNameByUnitId(units.get(0).getId());
            String consultantDoctor=shiftRepo.getConsultantDrByUnitId(units.get(0).getId());
            return new Shift(icuName,consultantDoctor,units);
    }


}
