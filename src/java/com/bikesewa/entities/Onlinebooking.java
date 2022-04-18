
package com.bikesewa.entities;

import java.sql.Date;

public class Onlinebooking {
    
     private int obid;
     private String c_name ;
     private String c_email ;
     private String bike_num;
     private String problems;
     private String   booking_date;
     private String booking_time;
     private Date   created_at ;
     private int uid;
     private int bid;

    public Onlinebooking(int obid, String c_name, String c_email, String bike_num, String problems, String booking_date, String booking_time, Date created_at, int uid, int bid) {
        this.obid = obid;
        this.c_name = c_name;
        this.c_email = c_email;
        this.bike_num = bike_num;
        this.problems = problems;
        this.booking_date = booking_date;
        this.booking_time =  booking_time;
        this.created_at = created_at;
        this.uid = uid;
        this.bid = bid;
    }

    public Onlinebooking(String c_name, String c_email, String bike_num, String problems, String booking_date,String booking_time,int uid, int bid) {
        this.c_name = c_name;
        this.c_email = c_email;
        this.bike_num = bike_num;
        this.problems = problems;
        this.booking_date = booking_date;
        this.booking_time =  booking_time;
        this.uid = uid;
        this.bid = bid;
    }

    public String getBooking_time() {
        return booking_time;
    }

    public void setBooking_time(String booking_time) {
        this.booking_time = booking_time;
    }

    public Onlinebooking() {
    }

    public int getObid() {
        return obid;
    }

    public void setObid(int obid) {
        this.obid = obid;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public String getC_email() {
        return c_email;
    }

    public void setC_email(String c_email) {
        this.c_email = c_email;
    }

    public String getBike_num() {
        return bike_num;
    }

    public void setBike_num(String bike_num) {
        this.bike_num = bike_num;
    }

    public String getProblems() {
        return problems;
    }

    public void setProblems(String problems) {
        this.problems = problems;
    }

    public String getBooking_date() {
        return booking_date;
    }

    public void setBooking_date(String booking_date) {
        this.booking_date = booking_date;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
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
    
}
