
package com.bikesewa.entities;

import java.sql.Date;


public class Servicinghistory {
    private int sid;
     private String bike_num;
     private int km;
     private int amount;
     private Date servicing_at;
     private String parts_changed;
     private Date next_servicing;
     private int next_km;
     private int uid;
     private int bid;
     private int mid;

    public Servicinghistory(int sid, String bike_num, int km, int amount, Date servicing_at, String parts_changed, Date next_servicing, int next_km, int uid, int bid, int mid) {
        this.sid = sid;
        this.bike_num = bike_num;
        this.km = km;
        this.amount = amount;
        this.servicing_at = servicing_at;
        this.parts_changed = parts_changed;
        this.next_servicing = next_servicing;
        this.next_km = next_km;
        this.uid = uid;
        this.bid = bid;
        this.mid = mid;
    }

    public Servicinghistory(String bike_num, int km, int amount, Date servicing_at, String parts_changed, Date next_servicing, int next_km, int uid, int bid, int mid) {
        this.bike_num = bike_num;
        this.km = km;
        this.amount = amount;
        this.servicing_at = servicing_at;
        this.parts_changed = parts_changed;
        this.next_servicing = next_servicing;
        this.next_km = next_km;
        this.uid = uid;
        this.bid = bid;
        this.mid = mid;
    }

    public Servicinghistory() {
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getBike_num() {
        return bike_num;
    }

    public void setBike_num(String bike_num) {
        this.bike_num = bike_num;
    }

    public int getKm() {
        return km;
    }

    public void setKm(int km) {
        this.km = km;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Date getServicing_at() {
        return servicing_at;
    }

    public void setServicing_at(Date servicing_at) {
        this.servicing_at = servicing_at;
    }

    public String getParts_changed() {
        return parts_changed;
    }

    public void setParts_changed(String parts_changed) {
        this.parts_changed = parts_changed;
    }

    public Date getNext_servicing() {
        return next_servicing;
    }

    public void setNext_servicing(Date next_servicing) {
        this.next_servicing = next_servicing;
    }

    public int getNext_km() {
        return next_km;
    }

    public void setNext_km(int next_km) {
        this.next_km = next_km;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }
 
}
