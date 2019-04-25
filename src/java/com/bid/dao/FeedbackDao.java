/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bid.dao;

import com.bid.bean.Feedback;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 97798
 */
public class FeedbackDao {
     public static Connection getConnection(){
        Connection conn = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost/online_bidding_system","root","");
        } catch (Exception e) {
            System.out.println(e);
        }
        return conn;
    }
     
     //insert feedback
     public static int addFeedback(Feedback f){
        int status=0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = null;
            String query = "insert into feedback (email , subject ,description) values(?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, f.getEmail());
            ps.setString(2,f.getSubject());
            ps.setString(3,f.getDescription());
            
            status = ps.executeUpdate();
                 
                 
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
     
     //insert feedback
     
     //show feedback
     
         public static List <Feedback> getAllFeedbackOfUser(){
        List<Feedback> list = new ArrayList<Feedback>();
        try {
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from feedback");
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    
                Feedback f = new Feedback();
                f.setFid(rs.getInt("fid"));
                f.setEmail(rs.getString("email"));
                f.setSubject(rs.getString("subject"));
                f.setDescription(rs.getString("description"));
                f.setFeedback_date(rs.getString("feedback_date"));
               
                list.add(f);
                
                }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
     //show feedback end
}
