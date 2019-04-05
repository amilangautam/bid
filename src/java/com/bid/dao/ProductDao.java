/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor
 */
package com.bid.dao;

import com.bid.bean.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author 97798
 */
public class ProductDao {
    //database connection
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
    
    //add product
    public static int addProduct(Product p){
        int status = 0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("insert into product (pname , category  , description, initialprice, date ,filename,path ) values(?,?,?,?,?,?,?)");
            
            //ps.setString(1,b.getEmail());
            ps.setString(1, p.getPname());
            ps.setString(2, p.getCategory());
            ps.setString(3, p.getDescription());
            ps.setString(4, p.getInitialprice());
            ps.setString(5, p.getDate());
            ps.setString(6, p.getFilename());
            ps.setString(7, p.getPath());
             
            status = ps.executeUpdate();
                 
                 
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    
    //finish add product
    
}
