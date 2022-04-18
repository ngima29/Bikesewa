
package com.bikesewa.entities;


public class Company {
    private int comid;
    private String com_name;

    public Company(int comid, String com_name) {
        this.comid = comid;
        this.com_name = com_name;
    }

    public Company() {
    }
    

    public int getComid() {
        return comid;
    }

    public void setComid(int comid) {
        this.comid = comid;
    }

    public String getCom_name() {
        return com_name;
    }

    public void setCom_name(String com_name) {
        this.com_name = com_name;
    }
    
    
}
