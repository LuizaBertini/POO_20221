/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Fatec
 */
public class Employees {
    private int EmployeeID;
    private String FirstName;
    private String LastName;
    private String Title;
    
    public static int getEmployeesCount() throws Exception {
        
        //ArrayList<Artists> list = new ArrayList<>();
        
        Class.forName("org.sqlite.JDBC");
        
        String url = "jdbc:sqlite:C:\\Users\\Fatec\\Desktop\\chinook.db";
        
        Connection conn = DriverManager.getConnection(url); // pega uma conexão a partir da url
        
        Statement stmt = conn.createStatement(); 
        
        ResultSet rs = stmt.executeQuery("select count(*) as count from employees"); // resultset -> permite navegar numa tabela
        
        int count = rs.getInt("count");
        /*
        while(rs.next()) {
            Artists a = new Artists(rs.getInt("ArtistId"), rs.getString("Name"));
            list.add(a);
        }*/
        
        rs.close();
        stmt.close();
        conn.close();
        
        return count;
    }
    
    public static ArrayList<Employees> getEmployeesList() throws Exception {
        
        ArrayList<Employees> list = new ArrayList<>();
        
        Class.forName("org.sqlite.JDBC");
        
        String url = "jdbc:sqlite:C:\\Users\\Fatec\\Desktop\\chinook.db";
        
        Connection conn = DriverManager.getConnection(url); // pega uma conexão a partir da url
        
        Statement stmt = conn.createStatement(); 
        
        ResultSet rs = stmt.executeQuery("select distinct employeeid, firstname, lastname, title from employees"); // resultset -> permite navegar numa tabela
        
        while(rs.next()) {
            Employees e = new Employees(rs.getInt("employeeid"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("title"));
            list.add(e);
        }
        
        rs.close();
        stmt.close();
        conn.close();
        
        return list;
    }

    public Employees(int EmployeeID, String FirstName, String LastName, String Title) {
        this.EmployeeID = EmployeeID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Title = Title;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public int getEmployeeID() {
        return EmployeeID;
    }

    public void setEmployeeID(int EmployeeID) {
        this.EmployeeID = EmployeeID;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }
    
    
}
