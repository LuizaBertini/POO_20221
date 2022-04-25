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
public class Contato {
    private String nome;
    private String telefone;
    private Data nascimento;
    
    public static ArrayList<Contato> getList(){
        ArrayList<Contato> list = new ArrayList<>();
        list.add(new Contato("Ana", "(11)987654321", new Data(10, 04, 1992)));
        list.add(new Contato("Luiza", "(11)912345678", new Data(21, 04, 2001)));
        list.add(new Contato("Pedro", "(11)913572468", new Data(02, 04, 2005)));
        list.add(new Contato("Agatha", "(--)---------", new Data(30, 07, 2022)));
        return list;
    }

    public Contato(String nome, String telefone, Data nascimento) {
        this.nome = nome;
        this.telefone = telefone;
        this.nascimento = nascimento;
    }

    public Data getNascimento() {
        return nascimento;
    }

    public void setNascimento(Data nascimento) {
        this.nascimento = nascimento;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
}
