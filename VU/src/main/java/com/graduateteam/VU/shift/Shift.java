package com.graduateteam.VU.shift;


import java.util.ArrayList;

public class Shift {
    //private Icu icu;
    private String icuName;
    private String consultantDoctor;
    private ArrayList<Unit> units;

    public Shift(String icuName, String consultantDoctor, ArrayList<Unit> units) {
        this.icuName = icuName;
        this.consultantDoctor = consultantDoctor;
        this.units = units;
    }

    public ArrayList<Unit> getUnits() {
        return units;
    }

    public void setUnits(ArrayList<Unit> units) {
        this.units = units;
    }

    public String getIcuName() {
        return icuName;
    }

    public void setIcuName(String icuName) {
        this.icuName = icuName;
    }

    public String getConsultantDoctor() {
        return consultantDoctor;
    }

    public void setConsultantDoctor(String consultantDoctor) {
        this.consultantDoctor = consultantDoctor;
    }
}
