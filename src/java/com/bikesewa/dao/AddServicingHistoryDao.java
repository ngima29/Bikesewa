
package com.bikesewa.dao;

import com.bikesewa.entities.Mechanics;
import com.bikesewa.entities.Servicinghistory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
     
   // get servicing details by sid
       public Servicinghistory getServicinghistoryById(int sid) {
        Servicinghistory servicinghistory = null;

        try {

            String query = "SELECT * FROM servicing_history where sid =?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1 , sid);
            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                servicinghistory = new Servicinghistory();
                   servicinghistory.setSid(set.getInt("sid"));
                   servicinghistory.setBike_num(set.getString("bike_num"));
                   servicinghistory.setKm(set.getInt("km"));
                   servicinghistory.setAmount(set.getInt("amount"));
                   servicinghistory.setServicing_at(set.getDate("servicing_at"));
                   servicinghistory.setParts_changed(set.getString("parts_changed"));
                   servicinghistory.setNext_servicing(set.getDate("next_servicing"));
                   servicinghistory.setNext_km(set.getInt("next_km"));
                   servicinghistory.setMid(set.getInt("mid"));
                   servicinghistory.setScname(set.getString("scname"));
                   servicinghistory.setScemail(set.getString("scemail"));
                   servicinghistory.setScid(set.getInt("scid"));
                   }

        } catch (Exception e1) {
            e1.printStackTrace();
        }

        return servicinghistory;
    }
    
       
//        update servicing history
           public boolean updateServicingHistory( Servicinghistory servicinghistory) {

        boolean f = false;
        try {         
                           
            String query = "update servicing_history set bike_num=?, km=?, amount=?, parts_changed=?, next_km=?, mid=?, scname=?, scemail=?, scid=?  where  sid =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, servicinghistory.getBike_num());
            p.setInt(2, servicinghistory.getKm() );
            p.setInt(3, servicinghistory.getAmount() );
            p.setString(4, servicinghistory.getParts_changed() );
            p.setInt(5, servicinghistory.getNext_km());
            p.setInt(6, servicinghistory.getMid() );
            p.setString(7, servicinghistory.getScname() );
            p.setString(8, servicinghistory.getScemail() );
            p.setInt(9, servicinghistory.getScid());
             p.setInt(10, servicinghistory.getSid());

            p.executeUpdate();
            System.out.println(" servicing history updated successfully.......");
            f = true;
          
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return f;
    }
    
    
    
     public boolean deleteServicingHistory(int sid) throws SQLException {
		boolean rowDeleted = false;
               
		try{
                        String qd = "delete from servicing_history where sid = ?";
                        PreparedStatement ps = this.con.prepareStatement(qd);
			ps.setInt(1, sid);
			ps.executeUpdate();
                        rowDeleted = true;
		}catch (Exception ed) {
            ed.printStackTrace();
        }
		return rowDeleted;
	}
    
     
       
 // last     
}
