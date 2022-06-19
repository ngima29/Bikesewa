
package com.bikesewa.entities;
import java.sql.*; 
import java.util.List;
public class User {
     private int uid;
     private String full_name;
     private String email;
     private String phone;
     private String gender;
     private String address;
     private String password;
     private String image;
     private Date   created_at ;
     private Date   updated_at ;

    public User(int id, String full_name, String email, String phone, String gender, String address, String password, String image, Date created_at, Date updated_at) {
        this.uid = id;
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.password = password;
        this.image = image;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }
      public User(String password, Date updated_at, int id) {
        this.password = password;
        this.updated_at = updated_at;
         this.uid = id;
      }

    public User(String full_name, String email, String phone, String gender, String address,  String password) {
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.password = password;
        
    }   
        public User(String full_name, String email, String phone, String gender, String address, String password, String image ) {
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.password = password;
        this.image = image;
    }
        
   public User(String name, String email, String pass) {
              this.full_name = name;
               this.email = email;
              this.password = pass;
             
    }

    public User() {
    }
    // getter and setter



    public int getUid() {
        return uid;
    }

    public void setUid(int id) {
        this.uid = id;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date  created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    
    
}

