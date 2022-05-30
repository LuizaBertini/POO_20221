/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Fatec
 */
public class Task {
    private int id;
    private String username;
    private String name;

    // construtor:inicio
    public Task(int id, String username, String name) {
        this.id = id;
        this.username = username;
        this.name = name;
    }
    // construtor:fim

    // getters e setters:inicio
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    // getters e setters:fim
    
    // metodos:inicio
    public static ArrayList<Task> getAllTasks() throws Exception {
        
        ArrayList<Task> list = new ArrayList<>();
        
        Class.forName("org.sqlite.JDBC"); // (tem q estar num try catch)
        String url = "jdbc:sqlite:mytasks.db"; // sem o caminho, irá criar um novo arquivo onde o proj está
        Connection conn = DriverManager.getConnection(url);
        Statement stmt = conn.createStatement();
        
        ResultSet rs = stmt.executeQuery("select * from tasks order by id");

        while(rs.next()){
            list.add(new Task(
                rs.getInt("id"),
                rs.getString("username"),
                rs.getString("title")
            ));
        }
        
        rs.close();
        conn.close();
        stmt.close();
        
        return list;
    }
    
    public static ArrayList<Task> getUserTasks(String username) throws Exception {
        
        ArrayList<Task> list = new ArrayList<>();
        
        Class.forName("org.sqlite.JDBC"); // (tem q estar num try catch)
        String url = "jdbc:sqlite:mytasks.db"; // sem o caminho, irá criar um novo arquivo onde o proj está
        Connection conn = DriverManager.getConnection(url);
        Statement stmt = conn.createStatement();
        
        PreparedStatement stmt2 = conn.prepareStatement("select * from tasks where username = ? order by id");
        stmt2.setString(1, username);
        
        ResultSet rs = stmt2.executeQuery();

        while(rs.next()){
            list.add(new Task(
                rs.getInt("id"),
                rs.getString("username"),
                rs.getString("title")
            ));
        }
        
        rs.close();
        conn.close();
        stmt.close();
        
        return list;
    }
    
    public static void AddTask(Task task) throws Exception {
                
        Class.forName("org.sqlite.JDBC"); 
        String url = "jdbc:sqlite:mytasks.db"; // sem o caminho, irá criar um novo arquivo onde o proj está
        Connection conn = DriverManager.getConnection(url);
        
        //comando para inserir um novo usuario no bdd
        PreparedStatement stmt = conn.prepareStatement("insert or ignore into tasks(username, title) values(? ,?)");
        //colocando os parametros no value da linha acima
        stmt.setString(1, task.getUsername());
        stmt.setString(2, task.getName());
        
        stmt.execute();
        
        conn.close();
        stmt.close();
        
    }
    
    public static void deleteTask(int id) throws Exception {
                
        Class.forName("org.sqlite.JDBC"); 
        String url = "jdbc:sqlite:mytasks.db"; // sem o caminho, irá criar um novo arquivo onde o proj está
        Connection conn = DriverManager.getConnection(url);
        
        PreparedStatement stmt = conn.prepareStatement("delete from tasks where id = ?");
        stmt.setInt(1, id);
        stmt.execute();
        
        conn.close();
        stmt.close();
        
    }

    // metodos:fim
    
    
}
