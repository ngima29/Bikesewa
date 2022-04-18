
package com.bikesewa.entities;

public class Model {
 
    private int modid;
    private String mod_name;

    public Model() {
    }

    public Model(int modid, String mod_name) {
        this.modid = modid;
        this.mod_name = mod_name;
    }

    public int getModid() {
        return modid;
    }

    public void setModid(int modid) {
        this.modid = modid;
    }

    public String getMod_name() {
        return mod_name;
    }

    public void setMod_name(String mod_name) {
        this.mod_name = mod_name;
    }
    
    
}
