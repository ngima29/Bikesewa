
package com.bikesewa.entities;

import java.sql.Date;

public class Mechanics {
     private int mid;
     private String full_name;
     private String email;
     private String phone;
     private String photo;
     private String gender;
     private String address;
     private String salary;
     private Date   created_at ;
     private Date   updated_at ;

    public Mechanics(int mid, String full_name, String email, String phone, String photo, String gender, String address, String salary, Date created_at, Date updated_at) {
        this.mid = mid;
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.photo = photo;
        this.gender = gender;
        this.address = address;
        this.salary = salary;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Mechanics(String full_name, String email, String phone, String photo, String gender, String address, String salary, Date created_at, Date updated_at) {
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.photo = photo;
        this.gender = gender;
        this.address = address;
        this.salary = salary;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }
     public Mechanics(String full_name, String email, String phone, String photo, String gender, String address, String salary) {
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.photo = photo;
        this.gender = gender;
        this.address = address;
        this.salary = salary;

    }

    public Mechanics() {
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
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

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
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

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
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
