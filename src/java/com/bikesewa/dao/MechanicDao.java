
package com.bikesewa.dao;
import com.bikesewa.entities.Mechanics;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;



public class MechanicDao {
     private Connection con;

    public MechanicDao(Connection con) {
        this.con = con;
    }
    
  // insert mechanic
     public boolean saveMechanic(Mechanics mechanics){
        boolean f=false;
        try{
          
            String q = "insert into Mechanic(full_name,email,phone,photo,gender,address,salary,created_at,updated_at) values(?,?,?,?,?,?,?,now(),now())";  
            PreparedStatement prestm = this.con.prepareStatement(q);
            prestm.setString(1,mechanics.getFull_name());
            prestm.setString(2,mechanics.getEmail());
            prestm.setString(3,mechanics.getPhone());
            prestm.setString(4,mechanics.getPhoto());
            prestm.setString(5,mechanics.getGender());
            prestm.setString(6,mechanics.getAddress());
            prestm.setString(7,mechanics.getSalary());
            prestm.executeUpdate();
            f=true;
//            System.out.println(" Mechanic added successfully");
        }catch(Exception e){
        e.printStackTrace();
    }
    return f;
}
    /// get Mechanics by id
    public Mechanics getMechanicsById(int mid) {
        Mechanics mechanics = null;

        try {

            String query = "select * from Mechanic where mid =?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1 , mid);
            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                mechanics = new Mechanics();

//             data from db
                String name = set.getString("full_name");
//             set to user object
                mechanics.setFull_name(name);

            
                mechanics.setMid(set.getInt("mid"));
                mechanics.setEmail(set.getString("email"));
                mechanics.setPhone(set.getString("phone"));
                 mechanics.setPhoto(set.getString("photo"));
                mechanics.setGender(set.getString("gender"));
                mechanics.setAddress(set.getString("address"));
                mechanics.setSalary(set.getString("salary"));               
                mechanics.setCreated_at(set.getDate("created_at"));
                mechanics.setUpdated_at(set.getDate("updated_at"));              
                
            }

        } catch (Exception e1) {
            e1.printStackTrace();
        }

        return mechanics;
    }
   
    // update user
    public boolean updateMechanics(Mechanics mechanics) {

        boolean f = false;
        try {

            String query = "update Mechanic set full_name=? , email=? , phone=?, photo=? , gender=? ,address=?, salary=? ,updated_at = now() where  mid =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, mechanics.getFull_name());
            p.setString(2, mechanics.getEmail());
            p.setString(3, mechanics.getPhone());
            p.setString(4, mechanics.getPhoto());
            p.setString(5, mechanics.getGender());
            p.setString(6, mechanics.getAddress());
            p.setString(7, mechanics.getSalary());
            p.setInt(8, mechanics.getMid());

            p.executeUpdate();
            System.out.println(" mechanic updated successfully.......");
            f = true;
          
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return f;
    }
    
    
    
     public boolean deleteMechanics(int mid) throws SQLException {
		boolean rowDeleted = false;
               
		try{
                        String qd = "delete from Mechanic where mid = ?";
                        PreparedStatement ps = this.con.prepareStatement(qd);
			ps.setInt(1, mid);
			ps.executeUpdate();
                        rowDeleted = true;
		}catch (Exception ed) {
            ed.printStackTrace();
        }
		return rowDeleted;
	}
    
    
}
