
package com.bikesewa.dao;

import com.bikesewa.entities.Servicinghistory;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddServicingHistoryDao {
    private Connection con;

    public AddServicingHistoryDao(Connection con) {
        this.con = con;
    }
    
     public boolean insertServicing(Servicinghistory servicinghistory){
        boolean f=false;
        try{
          
            String q = "insert into servicing_history(bike_num,km,amount,servicing_at,parts_changed,next_servicing,next_km,mid,scname,scemail,scid) values(?,?,?,?,?,?,?,?,?,?,?)";  
            PreparedStatement prestm = this.con.prepareStatement(q);
            prestm.setString(1,servicinghistory.getBike_num());
            prestm.setInt(2,servicinghistory.getKm());
            prestm.setInt(3,servicinghistory.getAmount());
            prestm.setDate(4,servicinghistory.getServicing_at());
            prestm.setString(5,servicinghistory.getParts_changed());
            prestm.setDate(6,servicinghistory.getNext_servicing());
            prestm.setInt(7,servicinghistory.getNext_km());
            prestm.setInt(8,servicinghistory.getMid());
            prestm.setString(9,servicinghistory.getScname());
            prestm.setString(10,servicinghistory.getScemail());
            prestm.setInt(11,servicinghistory.getScid());
            prestm.executeUpdate();
            f=true;
            System.out.println("success fully inserted");
        }catch(Exception e){
        e.printStackTrace();
    }
    return f;
}
     
     
     
 // last     
}
