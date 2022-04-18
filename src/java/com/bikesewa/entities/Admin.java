
package com.bikesewa.entities;

import java.sql.Date;

public class Admin {
     private int aid;
     private String full_name;
     private String email;
     private String phone;
     private String gender;
     private String address;
     private String password;
     private String photo;
     private Date   created_at ;
     private Date   updated_at ;

    public Admin(int aid, String full_name, String email, String phone, String gender, String address, String password, String photo, Date created_at, Date updated_at) {
        this.aid = aid;
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.password = password;
        this.photo = photo;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Admin(String full_name, String email, String phone, String gender, String address, String password,String photo, Date created_at, Date updated_at) {
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.password = password;
        this.photo = photo;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }
  public Admin(String full_name, String email, String phone, String gender, String address, String password,String photo) {
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.password = password;
        this.photo = photo;
   
    }
    public Admin() {
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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
     
}
