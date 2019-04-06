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
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
    
    //view product
    public static List <Product> getAllRecords(){
        List<Product> list = new ArrayList<Product>();
        try {
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from product");
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                Product p = new Product();
               
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("pname"));
                p.setPath(rs.getString("path"));
                p.setFilename(rs.getString("filename"));
                p.setCategory(rs.getString("category"));
                p.setDescription(rs.getString("description"));
                p.setInitialprice(rs.getString("initialprice"));
                p.setDate(rs.getString("date"));
                
                
                list.add(p);
                }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
        
         public static Product getRecordById(int pid){
        Product p= null;
        try {
            Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from product where pid = ?");
                ps.setInt(1,pid);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){
                p=new Product();
                p.setPid(rs.getInt("pid"));
                p.setPname(rs.getString("pname"));
                p.setPath(rs.getString("path"));
                p.setFilename(rs.getString("filename"));
                p.setCategory(rs.getString("category"));
                p.setDescription(rs.getString("description"));
                p.setInitialprice(rs.getString("initialprice"));
                p.setDate(rs.getString("date"));
                
               
                    } 
        }catch (Exception e) {
                System.out.println(e);
                }
        return p;
        }
    //view product
         
  //delete product by admin
    public static int deleteProduct(Product p){  
    int status=0;  
    try{  
        Connection conn=getConnection();  
        PreparedStatement ps=conn.prepareStatement("delete from product where pid=?");  
        ps.setInt(1, p.getPid());  
        status=ps.executeUpdate();  
    }catch(Exception e){
        System.out.println(e);}  
  
    return status;  
}
    //delete product finished
    
  //update product
    
    public static int updateProduct(Product p){  
    int status=0;  
    try{  
        Connection conn=getConnection();  
        PreparedStatement ps=conn.prepareStatement("update product set pname=?, category=?, description=?, initialprice=? ,date=? where pid=? ");  
          
        ps.setString(1, p.getPname());
        ps.setString(2, p.getCategory());
        ps.setString(3, p.getDescription());
        ps.setString(4, p.getInitialprice());
        ps.setString(5, p.getDate());
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
} 
    
    
    
   //update product finished 
}
