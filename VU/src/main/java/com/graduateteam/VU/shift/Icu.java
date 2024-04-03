package com.graduateteam.VU.shift;


public class Icu {
    private String icuName;
    private String consultantDoctor;

    public Icu(String icuName, String consultantDoctor) {
        this.icuName = icuName;
        this.consultantDoctor = consultantDoctor;
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
