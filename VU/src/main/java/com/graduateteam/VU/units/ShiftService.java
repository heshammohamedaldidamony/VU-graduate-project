package com.graduateteam.VU.units;

import com.graduateteam.VU.exception_handling.OutIndexException;
import com.graduateteam.VU.login.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShiftService {
    @Autowired
    private ShiftRepo shiftRepo;


    public Shift getShift(User user) {
        if(user.getRole().equals("doctor")){
            String doctorId = shiftRepo.getDoctorIdByPhone(user.getPhone());
            List<UnitDoctor> units= shiftRepo.getShiftUnitsByDoctorId(doctorId);
            if(units.isEmpty()){
                throw  new OutIndexException("No Shift");
            }
            Icu icu =shiftRepo.getIcuByUnitId(units.get(0).getId());
            return new Shift(icu, units);
        }
        else {
            String nurseId = shiftRepo.getNurseIdByPhone(user.getPhone());
            List<UnitNurse> units= shiftRepo.getShiftUnitsByNurseId(nurseId);
            if(units.isEmpty()){
                throw  new OutIndexException("No Shift");
            }
            Icu icu =shiftRepo.getIcuByUnitId(units.get(0).getId());
            return new Shift(icu, units);
        }

    }


}
