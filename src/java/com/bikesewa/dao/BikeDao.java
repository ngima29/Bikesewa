
package com.bikesewa.dao;

import com.bikesewa.entities.Bike;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class BikeDao {
    private Connection con;

    public BikeDao(Connection con) {
        this.con = con;
    }
   /// insert user into data base
    
    public boolean saveBike(Bike bike){
        boolean f=false;
        try{
          
            String q = "insert into bike(company, model, bike_img, color, bike_num, created_at,updated_at,uid,cname,cemail) values(?,?,?,?,?,now(),now(),?,?,?)";  
            PreparedStatement prestm = this.con.prepareStatement(q);
            prestm.setString(1,bike.getCompany());
            prestm.setString(2,bike.getModel());
            prestm.setString(3,bike.getBike_img());
            prestm.setString(4,bike.getColor());
            prestm.setString(5,bike.getBike_num());
            prestm.setInt(6,bike.getUid());
            prestm.setString(7,bike.getCname());
            prestm.setString(8,bike.getCemail());
           int row = prestm.executeUpdate();
            f=true;
            if(row>0)
			{
				System.out.println(" added into database successfully.");
			}
			
			else
			{
				System.out.println("Failed to upload .");
			}
        }catch(Exception e){
        e.printStackTrace();
    }
    return f;
}
    /// user getBikeByUid 
    public Bike getBikeByUid(int uid) {
        Bike bike = null;

        try {
            String query = "select * from bike where uid=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, uid);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
            //int bid = set.getInt(uid);
            int bid = set.getInt("bid");
            String company = set.getString("company"); 
            String model = set.getString("model");
            String bike_img = set.getString("bike_img");
            String color = set.getString("color");
            String bike_num = set.getString("bike_num");
            Date created_at = set.getDate("created_at");
            Date updated_at = set.getDate("updated_at");
            String cname = set.getString("cname"); 
            String cemail = set.getString("cemail");
            
            bike = new Bike(bid, company, model, bike_img, color, bike_num,  created_at, updated_at, uid, cname, cemail);

            }

        } catch (Exception e1) {
            e1.printStackTrace();
        }

        return bike;
    }
    
    
   
    ///last closing 
    
    public boolean updateBike(Bike bike) {

        boolean f = false;
        try {

            String query = "update bike set company=? , model=? , bike_img=? , color=? ,bike_num=?, updated_at = now(), cname=?, cemail=? where  bid =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, bike.getCompany());
            p.setString(2, bike.getModel());
            p.setString(3, bike.getBike_img());
            p.setString(4, bike.getColor());
            p.setString(5, bike.getBike_num());
            p.setString(6, bike.getCname());
            p.setString(7, bike.getCemail());
            p.setInt(8, bike.getBid());
            
            p.executeUpdate();
            f = true;

        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return f;
    }
    
}
