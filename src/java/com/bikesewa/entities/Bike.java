
package com.bikesewa.entities;

import java.sql.Date;
import java.sql.Timestamp;


public class Bike {
     private int bid;
     private String company;
     private String model;
     private String bike_img;
     private String color;
     private String bike_num;
     private Date  created_at ;
     private Date  updated_at ;
     private int uid;

    public Bike(int bid ,String company, String model, String bike_img, String color,String bike_num, Date created_at, Date updated_at,int uid) {
        this.bid = bid;
        this.company = company;
        this.model = model;
        this.bike_img = bike_img;
        this.color = color;
        this.bike_num=bike_num;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.uid =  uid;
    }
    public Bike(int id, String company, String model, String bike_img, String color,String bike_num, Date created_at, Date updated_at) {
        this.bid = id;
        this.company = company;
        this.model = model;
        this.bike_img = bike_img;
        this.color = color;
        this.bike_num=bike_num;
        this.created_at = created_at;
        this.updated_at = updated_at;
       
    }

    public Bike(String company, String model, String bike_img, String color,String bike_num, int uid) {
        this.company = company;
        this.model = model;
        this.bike_img = bike_img;
        this.color = color;
        this.bike_num=bike_num;
        this.uid = uid;
    }
    
    public Bike(String company, String model, String bike_img, String color,String bike_num, Date created_at,int uid) {
        this.company = company;
        this.model = model;
        this.bike_img = bike_img;
        this.color = color;
        this.bike_num=bike_num;
        this.created_at = created_at;
        this.uid = uid;
    }
       
    

    public Bike() {
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getBike_img() {
        return bike_img;
    }

    public void setBike_img(String bike_img) {
        this.bike_img = bike_img;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getBike_num() {
        return bike_num;
    }

    public void setBike_num(String bike_num) {
        this.bike_num = bike_num;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    
}
