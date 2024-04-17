package com.graduateteam.VU.units;


import java.util.List;

public class Shift<T extends Unit>  {
    private Icu icu;
    private List<T> units;

    public Shift(Icu icu, List<T> units) {
        this.icu = icu;
        this.units = units;
    }

    public List<T> getUnits() {
        return units;
    }

    public void setUnits(List<T> units) {
        this.units = units;
    }

    public Icu getIcu() {
        return icu;
    }

    public void setIcu(Icu icu) {
        this.icu = icu;
    }
}
