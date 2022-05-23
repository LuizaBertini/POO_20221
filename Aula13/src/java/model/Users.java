/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author Fatec
 */
public class Users {
    
    // variáveis
    private String username;
    private long passwordHash;
    private String name;
    
    public static void AddUsers(Users user) throws Exception {
                
        Class.forName("org.sqlite.JDBC"); 
        String url = "jdbc:sqlite:mytasks.db"; // sem o caminho, irá criar um novo arquivo onde o proj está
        Connection conn = DriverManager.getConnection(url);
        
        //comando para inserir um novo usuario no bdd
        PreparedStatement stmt = conn.prepareStatement("insert or ignore into users(username, name, pass_hash) values(? ,?, ?)");
        //colocando os parametros no value da linha acima
        stmt.setString(1, user.getUsername());
        stmt.setString(2, user.getName());
        stmt.setLong(3, user.getPasswordHash());
        
        stmt.execute();
        
        conn.close();
        stmt.close();
        
    }
    
    public static void DeleteUsers(String username) throws Exception {
                
        Class.forName("org.sqlite.JDBC"); 
        String url = "jdbc:sqlite:mytasks.db"; // sem o caminho, irá criar um novo arquivo onde o proj está
        Connection conn = DriverManager.getConnection(url);
        
        PreparedStatement stmt = conn.prepareStatement("delete from users where username = ?");
        stmt.setString(1, username);
        stmt.execute();
        
        conn.close();
        stmt.close();
        
    }
    
    public static void AlterUserPassword(String username, String newPassword) throws Exception {
                
        Class.forName("org.sqlite.JDBC"); 
        String url = "jdbc:sqlite:mytasks.db"; // sem o caminho, irá criar um novo arquivo onde o proj está
        Connection conn = DriverManager.getConnection(url);
        
        PreparedStatement stmt = conn.prepareStatement("update users set pass_hash = ? where username = ?");
        stmt.setString(1, newPassword);
        stmt.setString(2, username);
        stmt.execute();
        
        conn.close();
        stmt.close();
        
    }
    
    public static ArrayList<Users> getAllUsers() throws Exception {
        
        ArrayList<Users> list = new ArrayList<>();
        
        Class.forName("org.sqlite.JDBC"); // (tem q estar num try catch)
        String url = "jdbc:sqlite:mytasks.db"; // sem o caminho, irá criar um novo arquivo onde o proj está
        Connection conn = DriverManager.getConnection(url);
        Statement stmt = conn.createStatement();
        
        ResultSet rs = stmt.executeQuery("select * from users order by name");

        while(rs.next()){
            list.add(new Users(
                rs.getString("username"),
                rs.getLong("pass_hash"),
                rs.getString("name")
            ));
        }
        
        rs.close();
        conn.close();
        stmt.close();
        
        return list;
    }
    
    public static Users getUsers(String username, String password) throws Exception {
        
        Users user = null;
                
        Class.forName("org.sqlite.JDBC"); // (tem q estar num try catch)
        String url = "jdbc:sqlite:mytasks.db"; // sem o caminho, irá criar um novo arquivo onde o proj está
        Connection conn = DriverManager.getConnection(url);
        PreparedStatement stmt = conn.prepareStatement(
                "select * from users where username = ? and pass_hash = ?"
        );
        stmt.setString(1, username);
        stmt.setLong(2, password.hashCode());
        
        ResultSet rs = stmt.executeQuery();

        if(rs.next()) {
            user = new Users(
            rs.getString("username"),
            rs.getLong("pass_hash"),
            rs.getString("name"));
        }
        
        rs.close();
        conn.close();
        stmt.close();
        
        return user;
    }

    public Users(String username, long passwordHash, String name) {
        this.username = username;
        this.passwordHash = passwordHash;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public long getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(long passwordHash) {
        this.passwordHash = passwordHash;
    }
    
}
