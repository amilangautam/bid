/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bid.dao;

import com.bid.bean.Bid;
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
public class BidDao {
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
     //bid product start
     public static int bidProduct(Bid bd){
        int status = 0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("insert into bid (pid, email, bid_price) values(?,?,?)");
            
            ps.setInt(1, bd.getPid());
            ps.setString(2, bd.getEmail());
            ps.setString(3, bd.getBid_price());
            status = ps.executeUpdate();
                 
                 
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
     //bid product end
     public static List <Bid> getMyBidByEmail(String email){
         List<Bid> list = new ArrayList<Bid>();
        try {
            Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement("SELECT b.email, b.bid_price , b.status , p.pname , p.initialprice , p.date , p.filename from bid b INNER JOIN product p on b.pid = p.pid where email = ?");
                ps.setString(1,email);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){
                Bid b = new Bid();
                b.setEmail(rs.getString("email"));
                b.setBid_price(rs.getString("bid_price"));
                b.setStatus(rs.getString("status"));
                b.setPname(rs.getString("pname"));
                b.setInitialprice(rs.getString("initialprice"));
                b.setDate(rs.getString("date"));
                b.setFilename(rs.getString("filename"));
                
                
                
                
                list.add(b);
                } 
        }catch (Exception e) {
                System.out.println(e);
                }
        return list;
        }

     

    
}
