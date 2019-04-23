/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bid.dao;

import com.bid.bean.UserLogin;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 97798
 */
public class UserLoginDao {
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
     
     
     
     
     
     //insert user 
        public static int insert(UserLogin b){
        int status=0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = null;
            String query = "insert into user (firstname , lastname ,address , email, mobile ,password ) values(?,?,?,?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, b.getFirstname());
            ps.setString(2,b.getLastname());
            ps.setString(3,b.getAddress());
            ps.setString(4,b.getEmail());
            ps.setString(5,b.getMobile());
            ps.setString(6,b.getPassword());
            status = ps.executeUpdate();
                 
                 
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
        
    //insert user finished    
 
        
  //insert admin 
        public static int insertAdmin(UserLogin b){
        int status=0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = null;
            String query = "insert into user (firstname , lastname ,address , email, mobile ,password ,role ) values(?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, b.getFirstname());
            ps.setString(2,b.getLastname());
            ps.setString(3,b.getAddress());
            ps.setString(4,b.getEmail());
            ps.setString(5,b.getMobile());
            ps.setString(6,b.getRole());
            ps.setString(7,b.getPassword());
            status = ps.executeUpdate();
                 
                 
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
        
    //insert admin finished 
    
    //edit user by admin start
    
    //update
    public static int updateUser(UserLogin b){  
    int status=0;  
    try{  
        Connection conn=getConnection();  
        PreparedStatement ps= null;
        String updateQuery = ("update user set firstname =? , lastname= ? ,address =? , email =?, mobile = ? , role = ? ,password = ? where user_id=? ");  
        ps = conn.prepareStatement(updateQuery);
            ps.setString(1,b.getFirstname());
            ps.setString(2,b.getLastname());
            ps.setString(3,b.getAddress());
            ps.setString(4,b.getEmail());
            ps.setString(5,b.getMobile());
            ps.setString(6,b.getRole());
            ps.setString(7,b.getPassword());
            ps.setInt(8,b.getUser_id());
            
            status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
    return status;  
} 
    //edit user by admin finished
   
        
    //check user type
    public String check_admin(UserLogin b){
            Connection conn = getConnection();
            ResultSet rs =null;
            Statement st = null;
            String varEmail="";
            String varPassword="";
            String varRole ="";
            String email= b.getEmail();
            String password =b.getPassword();
        try {        
              st =conn.createStatement();
              String query = "select email, password , role from user";
              rs = st.executeQuery(query);
              while(rs.next())
              {
                  varEmail= rs.getString("email");
                  varPassword= rs.getString("password");
                  varRole= rs.getString("role");
                  if(email.equals(varEmail) && password.equals(varPassword) && varRole.equals("admin"))
                      return "admin_role";
                  else if(email.equals(varEmail) && password.equals(varPassword) && varRole.equals("user"))
                      return "user_role";
              }
        } catch (SQLException e) {
            System.out.println(e);
        }finally{
                try {
                       if(conn!=null){
                           conn.close();
                       }
                     } catch (Exception e) {
                     }
          }
        return "invalid";
    
    }  
//finished checking user type    

 
    public static List <UserLogin> getAllRecordsOfUser(){
        List<UserLogin> list = new ArrayList<UserLogin>();
        try {
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from user");
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    
                UserLogin b = new UserLogin();
                b.setUser_id(rs.getInt("user_id"));
                b.setFirstname(rs.getString("firstname"));
                b.setLastname(rs.getString("lastname"));
                b.setAddress(rs.getString("address"));
                b.setEmail(rs.getString("email"));
                b.setMobile(rs.getString("mobile"));
                b.setPassword(rs.getString("password"));
                b.setRole(rs.getString("role"));
                b.setRegistered_date(rs.getString("registered_date"));
                list.add(b);
                
                }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
        
     public static UserLogin getRecordById(int user_id){
        UserLogin b= null;
        try {
            Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from user where user_id = ?");
                ps.setInt(1,user_id);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){
                b = new UserLogin();
                b.setUser_id(rs.getInt("user_id"));
                b.setFirstname(rs.getString("firstname"));
                b.setLastname(rs.getString("lastname"));
                b.setAddress(rs.getString("address"));
                b.setEmail(rs.getString("email"));
                b.setMobile(rs.getString("mobile"));
                b.setPassword(rs.getString("password"));  
                b.setRole(rs.getString("role"));
               
                    } 
        }catch (Exception e) {
                System.out.println(e);
                }
        return b;
        }
    //view product
     
     
   //delete user by admin
    public static int deleteUser(UserLogin b){  
    int status=0;  
    try{  
        Connection conn=getConnection();  
        PreparedStatement ps=conn.prepareStatement("delete from user where user_id=?");  
        ps.setInt(1, b.getUser_id());  
        status=ps.executeUpdate();  
    }catch(Exception e){
        System.out.println(e);}  
  
    return status;  
}
    //delete user finished

    
    
    
     
    //check email and password
//    public boolean check_user(UserLogin b){
//    boolean flag = false;
//   
//            Connection conn = getConnection();
//            ResultSet rs =null;
//            PreparedStatement ps = null;
//        try {
//            String qry ="select * from user where email = ? and password = ?";
//            ps = conn.prepareStatement(qry);
//            ps.setString(1, b.getEmail());
//            ps.setString(2, b.getPassword());
//            System.out.println(ps);
//            rs = ps.executeQuery();
//            
//            if(rs.next()){
//                 flag= true;
//                        }
//        } catch (Exception e) {
//            System.out.println(e);
//        }finally{
//                try {
//                       if(conn!=null){
//                           conn.close();
//                       }
//                     } catch (Exception e) {
//                     }
//          }
//        return flag;
//    
//    }     
        
        
}
