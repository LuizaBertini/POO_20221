/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo;

import java.util.ArrayList;

/**
 *
 * @author Fatec
 */
public class DataBase {

    public static ArrayList<Contato> getContatos(){
        ArrayList<Contato> list = new ArrayList<>();
        list.add(new Contato("Paula", "(11)987654321", new Data(10, 04, 1992)));
        list.add(new Contato("Luana", "(11)912345678", new Data(21, 04, 2001)));
        list.add(new Contato("Pietro", "(11)913572468", new Data(02, 04, 2005)));
        list.add(new Contato("Agnes", "(--)---------", new Data(30, 07, 2022)));
        return list;
    }
    
}
