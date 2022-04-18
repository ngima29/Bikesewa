
package com.bikesewa.dao;

import com.bikesewa.entities.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {

 private Connection con;
  
    public AdminDao(Connection con) {
        this.con = con;
    }
    
    // insert
    public boolean insertAdmin(Admin admin){
        boolean f=false;
        try{
          
            String q = "insert into admin(full_name,email,phone,gender,address,password,photo,created_at,updated_at) values(?,?,?,?,?,?,?,now(),now())";  
            PreparedStatement prestm = this.con.prepareStatement(q);
            prestm.setString(1,admin.getFull_name());
            prestm.setString(2,admin.getEmail());
            prestm.setString(3,admin.getPhone());
            prestm.setString(4,admin.getGender());
            prestm.setString(5,admin.getAddress());
            prestm.setString(6,admin.getPassword());
            prestm.setString(7,admin.getPhoto());
            prestm.executeUpdate();
            f=true;
        }catch(Exception e){
        e.printStackTrace();
    }
    return f;
}
    /// user getUseremail and getUserpassword
    public Admin getAdminByEmailAndPassword(String email, String password) {
      
        Admin admin = null;

        try {

            String query = "select * from admin where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                admin = new Admin();

//             data from db
                String name = set.getString("full_name");
//             set to user object
                admin.setFull_name(name);

                admin.setAid(set.getInt("aid"));
                admin.setEmail(set.getString("email"));
                admin.setPhone(set.getString("phone"));
                admin.setGender(set.getString("gender"));
                admin.setAddress(set.getString("address"));
                admin.setPassword(set.getString("password"));
                admin.setPassword(set.getString("photo"));
                admin.setCreated_at(set.getDate("created_at"));
                admin.setUpdated_at(set.getDate("updated_at"));

            }

        } catch (Exception e1) {
            e1.printStackTrace();
        }

        return admin;
    }
   
    // update user
    public boolean updateAdmin(Admin admin) {

        boolean f = false;
        try {

            String query = "update admin set full_name=? , email=? , phone=? , gender=? ,address=?, password=?, photo=? ,updated_at = now() where  aid =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, admin.getFull_name());
            p.setString(2, admin.getEmail());
            p.setString(3, admin.getPhone());
            p.setString(4, admin.getGender());
            p.setString(5, admin.getAddress());
            p.setString(6, admin.getPassword());
            p.setString(7, admin.getPhoto());
            p.setInt(8, admin.getAid());

            p.executeUpdate();
            f = true;

        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return f;
    }
    //select user by id
//    public List<User> selectAllUsers() {
//
//		List<User> users = new ArrayList<>();
//		User user = null;
//		try {
//                    String query = "select * from user";
//                    PreparedStatement p = con.prepareStatement(query);
//			System.out.println(p);
//			
//			ResultSet set = p.executeQuery();
//
//			// Step 4: Process the ResultSet object.
//			while (set.next()) {
//                            user.setUid(set.getInt("uid"));
//                            user.setFull_name(set.getString("full_name"));
//                            user.setEmail(set.getString("email"));
//                            user.setPhone(set.getString("phone"));
//                            user.setGender(set.getString("gender"));
//                            user.setAddress(set.getString("address"));
//                            user.setPassword(set.getString("password"));
//                            user.setCreated_at(set.getDate("created_at"));
//                            user.setUpdated_at(set.getDate("updated_at"));
//                            user.setImage(set.getString("image"));
//
//                           users.add(user);
//                           //new User(uid, full_name, email, phone, gender, image, created_at, updated_at)
//                           
//                           
//			}
//                        set.close();
//		} catch (Exception ea) {
//                     ea.printStackTrace();
//        }
//
//		return users;
//	}
//    
//    
//    
//    
//    
//  //delecte user
//    public boolean deleteUserById(int id) throws SQLException {
//		boolean rowDeleted = false;
//               
//		try{
//                        String qd = "delete from user where uid = ?";
//                        PreparedStatement ps = this.con.prepareStatement(qd);
//			ps.setInt(1, id);
//			ps.executeUpdate();
//                        rowDeleted =  true;
//		}catch (Exception ed) {
//            ed.printStackTrace();
//        }
//		return rowDeleted;
//	}
//    
    /// select user by id 
    
    public Admin getAdminById(int aid) {
        Admin admin = null;
        try {
            String q = "select * from admin where aid=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, aid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                admin = new Admin();
                

//             data from db
                 String name = set.getString("full_name");
//             set to user object
                admin.setFull_name(name);
                admin.setAid(set.getInt("aid"));
                admin.setEmail(set.getString("email"));
                admin.setPhone(set.getString("phone"));
                admin.setGender(set.getString("gender"));
                admin.setAddress(set.getString("address"));
                admin.setPassword(set.getString("password"));
                admin.setPassword(set.getString("photo"));
                admin.setCreated_at(set.getDate("created_at"));
                admin.setUpdated_at(set.getDate("updated_at"));
   
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
    
    
    
   public boolean deleteAdmin(int aid) throws SQLException {
		boolean rowDeleted = false;
               
		try{
                        String qd = "delete from admin where aid = ?";
                        PreparedStatement ps = this.con.prepareStatement(qd);
			ps.setInt(1, aid);
			ps.executeUpdate();
                        rowDeleted = true;
		}catch (Exception ed) {
            ed.printStackTrace();
        }
		return rowDeleted;
	} 
    
    
    
}