/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo;

/**
 *
 * @author Fatec
 */
public class Disciplina {
    
    //atributos/variaveis
    private String sigla;
    private String nome;
    private String ementa;
    private String dia_semana;
    private String horario;

    public Disciplina(String sigla, String nome) {
        this.sigla = sigla;
        this.nome = nome;
    }

    public Disciplina(String sigla, String nome, String ementa, String dia_semana, String horario) {
        this.sigla = sigla;
        this.nome = nome;
        this.ementa = ementa;
        this.dia_semana = dia_semana;
        this.horario = horario;
    }
    
    

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public String getEmenta() {
        return ementa;
    }

    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }

    public String getDia_semana() {
        return dia_semana;
    }

    public void setDia_semana(String dia_semana) {
        this.dia_semana = dia_semana;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }
    
    
}


