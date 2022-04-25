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
public class Data {
    // variáveis
    private int dia;
    private int mes;
    private int ano;
    
    //construtores
    public Data(){
        dia = 1;
        mes = 1;
        ano = 2000;
    }
    
    //construtores - parametrizado
    public Data(int dia, int mes, int ano){
        this.dia = dia;
        this.mes = mes;
        this.ano = ano;
    }
    
    // sets - variáveis
    // inicio
    public void setDia(int dia){
        this.dia = dia;
    }
    
    public void setMes(int mes){
        this.mes = mes;
    }
    
    public void setAno(int ano){
        this.ano = ano;
    }
    // fim
    
    // gets - variáveis
    // inicio
    public Integer getDia(){
        return dia;
    }
    
    public Integer getMes(){
        return mes;
    }
    
    public Integer getAno(){
        return ano;
    }
    // fim
    
    // classe p atribuir valor as variáveis
    public void setData(int a, int b, int c){
        this.dia = a;
        this.mes = b;
        this.ano = c;
    }
    
    // retorna a data formatada
    public String getData(){
        return dia + "/" + mes + "/" + ano;
    }
    
    // retorna a data de nascimento formatada (somente dia e mes)
    public String getAniversario(){
        return dia + "/" + mes;
    }
}
