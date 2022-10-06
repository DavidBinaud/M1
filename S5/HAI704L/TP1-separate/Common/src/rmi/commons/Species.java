package rmi.commons;

import java.io.Serializable;

public class Species implements Serializable {
    private String name;

    private int lifeExpectancy;

    public Species(String name, int lifeExpectancy) {
        this.name = name;
        this.lifeExpectancy = lifeExpectancy;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getLifeExpectancy() {
        return lifeExpectancy;
    }

    public void setLifeExpectancy(int lifeExpectancy) {
        this.lifeExpectancy = lifeExpectancy;
    }

    @Override
    public String toString() {
        return "Specie{" +
                "name='" + name + '\'' +
                ", lifeExpectancy=" + lifeExpectancy +
                '}';
    }
}
