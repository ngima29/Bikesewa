
package com.bikesewa.dao;

import com.bikesewa.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private Connection con;
  
    public UserDao(Connection con) {
        this.con = con;
    }
   /// insert user into data base
    
    public boolean saveUser(User user){
        boolean f=false;
        try{
          
            String q = "insert into user(full_name,email,phone,gender,address,password,created_at,updated_at) values(?,?,?,?,?,?,now(),now())";  
            PreparedStatement prestm = this.con.prepareStatement(q);
            prestm.setString(1,user.getFull_name());
            prestm.setString(2,user.getEmail());
            prestm.setString(3,user.getPhone());
            prestm.setString(4,user.getGender());
            prestm.setString(5,user.getAddress());
            prestm.setString(6,user.getPassword());
            prestm.executeUpdate();
            f=true;
        }catch(Exception e){
        e.printStackTrace();
    }
    return f;
}
    /// user getUseremail and getUserpassword
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String query = "select * from user where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("full_name");
//             set to user object
                user.setFull_name(name);

                user.setUid(set.getInt("uid"));
                user.setEmail(set.getString("email"));
                user.setPhone(set.getString("phone"));
                user.setGender(set.getString("gender"));
                user.setAddress(set.getString("address"));
                user.setPassword(set.getString("password"));
                user.setCreated_at(set.getDate("created_at"));
                user.setUpdated_at(set.getDate("updated_at"));
                user.setImage(set.getString("image"));
               

            }

        } catch (Exception e1) {
            e1.printStackTrace();
        }

        return user;
    }
   
    // update user
    public boolean updateUser(User user) {

        boolean f = false;
        try {

            String query = "update user set full_name=? , email=? , phone=? , gender=? ,address=?, password=? , image=?, updated_at = now() where  uid =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getFull_name());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPhone());
            p.setString(4, user.getGender());
            p.setString(5, user.getAddress());
            p.setString(6, user.getPassword());
            p.setString(7, user.getImage());
            p.setInt(8, user.getUid());

            p.executeUpdate();
            f = true;

        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return f;
    }
    //select user by id
    public List<User> selectAllUsers() {

		List<User> users = new ArrayList<>();
		User user = null;
		try {
                    String query = "select * from user";
                    PreparedStatement p = con.prepareStatement(query);
			System.out.println(p);
			
			ResultSet set = p.executeQuery();

			// Step 4: Process the ResultSet object.
			while (set.next()) {
                            user.setUid(set.getInt("uid"));
                            user.setFull_name(set.getString("full_name"));
                            user.setEmail(set.getString("email"));
                            user.setPhone(set.getString("phone"));
                            user.setGender(set.getString("gender"));
                            user.setAddress(set.getString("address"));
                            user.setPassword(set.getString("password"));
                            user.setCreated_at(set.getDate("created_at"));
                            user.setUpdated_at(set.getDate("updated_at"));
                            user.setImage(set.getString("image"));

                           users.add(user);
                           //new User(uid, full_name, email, phone, gender, image, created_at, updated_at)
                           
                           
			}
                        set.close();
		} catch (Exception ea) {
                     ea.printStackTrace();
        }

		return users;
	}
    
    
    
    
    
  //delecte user
    public boolean deleteUserById(int id) throws SQLException {
		boolean rowDeleted = false;
               
		try{
                        String qd = "delete from user where uid = ?";
                        PreparedStatement ps = this.con.prepareStatement(qd);
			ps.setInt(1, id);
			ps.executeUpdate();
                        rowDeleted =  true;
		}catch (Exception ed) {
            ed.printStackTrace();
        }
		return rowDeleted;
	}
    
    /// select user by id 
    
    public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from user where uid=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();

//             data from db
                 String name = set.getString("full_name");
//             set to user object
                user.setFull_name(name);
                user.setUid(set.getInt("uid"));
                user.setEmail(set.getString("email"));
                user.setPhone(set.getString("phone"));
                user.setGender(set.getString("gender"));
                user.setAddress(set.getString("address"));
                user.setPassword(set.getString("password"));
                user.setCreated_at(set.getDate("created_at"));
                user.setUpdated_at(set.getDate("updated_at"));
                user.setImage(set.getString("image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
    //get user by email
     public User getUserByEmail(String uemail) {
        User user = null;
        try {
            String q = "select * from user where email=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            
            ps.setString(1,uemail);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();

//             data from db
                 String name = set.getString("full_name");
//             set to user object
                user.setFull_name(name);
                user.setUid(set.getInt("uid"));
                user.setEmail(set.getString("email"));
                user.setPhone(set.getString("phone"));
                user.setGender(set.getString("gender"));
                user.setAddress(set.getString("address"));
                user.setPassword(set.getString("password"));
                user.setCreated_at(set.getDate("created_at"));
                user.setUpdated_at(set.getDate("updated_at"));
                user.setImage(set.getString("image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
    
    
     /// forgot password user
    public boolean forgotPass(String email, String phone, String password) {

        boolean f = false;
         User user = null;
        try {

            String query = "select * from user where email =? and phone = ?";
            String q2 = "UPDATE user SET password = ?  WHERE email = ?";
            
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, email);
            p.setString(2, phone);

            ResultSet rs = p.executeQuery();
            if (rs.next()) {
            p.executeUpdate(q2);
            p.setString(1, email);
            p.setString(2, phone);
            System.out.println("query updated");
            
            
//            user = new User();       
//            user.setPassword(rs.getString("password"));
            f = true;
            }

        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return f;
    }
    
}

