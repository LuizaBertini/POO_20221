/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;

/**
 * Web application lifecycle listener.
 *
 * @author Fatec
 */
public class CreateListener implements ServletContextListener {

    public static Exception exception = null;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            // conexão com o sqlite
            Class.forName("org.sqlite.JDBC"); // (tem q estar num try catch)
            String url = "jdbc:sqlite:mytasks.db"; // sem o caminho, irá criar um novo arquivo onde o proj está
            Connection conn = DriverManager.getConnection(url);
            Statement stmt = conn.createStatement();
            
            // comandos sql
            //stmt.execute("drop table users");
            String SQL = "create table if not exists users( username varchar primary key, pass_hash integer not null, name varchar not null)";
            stmt.execute(SQL);
            stmt.execute("insert or ignore into users values('Admin',20761617,'Administrador')"); // o número da senha veio do: "admin1234".hashCode() 
            stmt.execute("insert or ignore into users values('Fulano',1509442,'Fulano')");
            
            conn.close();
            stmt.close();
        }
        catch(Exception ex){
            exception = ex;
        }
    }   

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
