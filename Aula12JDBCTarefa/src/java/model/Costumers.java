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
public class Costumers {
    private int CostumerID;
    private String FirstName;
    private String LastName;
    private String Company;
    
    public static int getCostumersCount() throws Exception {
        
        //ArrayList<Artists> list = new ArrayList<>();
        
        Class.forName("org.sqlite.JDBC");
        
        String url = "jdbc:sqlite:C:\\Users\\Fatec\\Desktop\\chinook.db";
        
        Connection conn = DriverManager.getConnection(url); // pega uma conexão a partir da url
        
        Statement stmt = conn.createStatement(); 
        
        ResultSet rs = stmt.executeQuery("select count(*) as count from customers"); // resultset -> permite navegar numa tabela
        
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
    
    public static ArrayList<Costumers> getCostumersList() throws Exception {
        
        ArrayList<Costumers> list = new ArrayList<>();
        
        Class.forName("org.sqlite.JDBC");
        
        String url = "jdbc:sqlite:C:\\Users\\Fatec\\Desktop\\chinook.db";
        
        Connection conn = DriverManager.getConnection(url); // pega uma conexão a partir da url
        
        Statement stmt = conn.createStatement(); 
        
        ResultSet rs = stmt.executeQuery("select distinct CustomerId, firstname, lastname, company from customers"); // resultset -> permite navegar numa tabela
        
        while(rs.next()) {
            Costumers c = new Costumers(rs.getInt("CustomerId"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("company"));
            list.add(c);
        }
        
        rs.close();
        stmt.close();
        conn.close();
        
        return list;
    }

    public Costumers(int CostumerID, String FirstName, String LastName, String Company) {
        this.CostumerID = CostumerID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Company = Company;
    }

    public String getCompany() {
        return Company;
    }

    public void setCompany(String Company) {
        this.Company = Company;
    }

    public int getCostumerID() {
        return CostumerID;
    }

    public void setCostumerID(int CostumerID) {
        this.CostumerID = CostumerID;
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
