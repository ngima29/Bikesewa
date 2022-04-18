
package com.bikesewa.dao;

import com.bikesewa.entities.User;
import com.bikesewa.entities.UserFeedback;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserFeedbackDao {
 private Connection con;

    public UserFeedbackDao(Connection con) {
        this.con = con;
    }
 public boolean saveUserFeedback(UserFeedback userFeedback){
        boolean f=false;
        try{
          
            String q = "insert into userfeedback(u_name,u_email,Message,uid,created_at) values(?,?,?,?,now())";  
            PreparedStatement prestm = this.con.prepareStatement(q);
            prestm.setString(1,userFeedback.getU_name());
            prestm.setString(2,userFeedback.getU_email());
            prestm.setString(3,userFeedback.getMessage());
            prestm.setInt(4,userFeedback.getUid());
            prestm.executeUpdate();
            f=true;
        }catch(Exception e){
        e.printStackTrace();
    }
    return f;
}
    
    
 
 
 
}
