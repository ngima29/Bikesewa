
package com.bikesewa.entities;

import java.sql.Date;

public class UserFeedback {
     private int ufbid;
     private String u_name;
     private String u_email;
     private String Message;
     private int uid;
     private Date   created_at ;

    public UserFeedback(int ufbid, String u_name, String u_email, String Message, int uid, Date created_at) {
        this.ufbid = ufbid;
        this.u_name = u_name;
        this.u_email = u_email;
        this.Message = Message;
        this.uid = uid;
        this.created_at = created_at;
    }

    public UserFeedback(String u_name, String u_email, String Message, int uid) {
        this.u_name = u_name;
        this.u_email = u_email;
        this.Message = Message;
        this.uid = uid;
    }

    public UserFeedback() {
    }

    public int getUfbid() {
        return ufbid;
    }

    public void setUfbid(int ufbid) {
        this.ufbid = ufbid;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_email() {
        return u_email;
    }

    public void setU_email(String u_email) {
        this.u_email = u_email;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    
}
