package com.bikesewa.dao;

import com.bikesewa.entities.Onlinebooking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;

public class OnlinebookingDao {

    private Connection con;

    public OnlinebookingDao(Connection con) {
        this.con = con;
    }

    public String isAccepted(int id) {
        String status = null;
        try {
            String q = "SELECT booking_status FROM onlinebooking WHERE obid=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, id);
            ResultSet result = pstmt.executeQuery();
            if (result.next()) {
                status = result.getString("booking_status");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public boolean updateBookingStatus(int id, String status) {
        boolean f = false;
        try {
            String q = "UPDATE onlinebooking SET booking_status=? WHERE obid=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, status);
            pstmt.setInt(2, id);
            int result = pstmt.executeUpdate();
            if (result > 0) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean insertBooking(Onlinebooking onlinebooking) {
        boolean f = false;
        try {

            String q = "insert into onlinebooking(c_name, c_email, bike_num, problems, booking_date, booking_time, created_at,uid,bid) values(?,?,?,?,?,?,now(),?,?)";
            PreparedStatement prestm = this.con.prepareStatement(q);
            prestm.setString(1, onlinebooking.getC_name());
            prestm.setString(2, onlinebooking.getC_email());
            prestm.setString(3, onlinebooking.getBike_num());
            prestm.setString(4, onlinebooking.getProblems());
            prestm.setString(5, onlinebooking.getBooking_date());
            prestm.setString(6, onlinebooking.getBooking_time());
            prestm.setInt(7, onlinebooking.getUid());
            prestm.setInt(8, onlinebooking.getBid());
            int row = prestm.executeUpdate();
            f = true;
            if (row > 0) {
                System.out.println(" booked  successfully.");
            } else {
                System.out.println("Failed to Booked .");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    
    
     public boolean deleteAcceptBooking(int scid) throws SQLException {
		boolean rowDeleted = false;
               
		try{
                        String qd = "delete from onlinebooking where booking_status = '1' AND  uid = ?";
                        PreparedStatement ps = this.con.prepareStatement(qd);
			ps.setInt(1, scid);
			ps.executeUpdate();
                        rowDeleted = true;
		}catch (Exception ed) {
            ed.printStackTrace();
        }
		return rowDeleted;
	}
     
     
     public boolean CancelOnlineBooking(int obid) throws SQLException {
		boolean rd = false;
               
		try{
                        String qc = "delete from onlinebooking where booking_status IS NULL AND  obid = 11;";
                        PreparedStatement prs = this.con.prepareStatement(qc);
			prs.setInt(1, obid);
			prs.executeUpdate();
                        rd = true;
		}catch (Exception ed) {
            ed.printStackTrace();
        }
		return rd;
	}

}
