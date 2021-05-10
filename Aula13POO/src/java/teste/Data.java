/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

/**
 * Classe para manipulação de datas de acorco com o calendário gregoriano
 * @author rlarg
 */
public class Data {
    //Atributos encapsulados (privados)
    /**
     * variável que representa o dia da data
     */
    private int dia;
    /**
     * variável que representa o mês da data
     */
    private int mes;
    /**
     * variável que representa o ano da data
     */
    private int ano;
    
    //Construtores
    /**
     * Instancia a data com dia = 1, mês = 1 e ano = 2000.
     */
    public Data(){
        dia = 1;
        mes = 1;
        ano = 2000;
    }
    /**
     * Instancia a data com os parâmetros informados
     * @param dia
     * @param mes
     * @param ano 
     */
    public Data(int dia, int mes, int ano){
        this.dia = dia;
        this.mes = mes;
        this.ano = ano;
    }
    
    //Métodos getters e setters
    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }
    
    //Métodos complementares
    public String getAniversário(){
        String out = "";
        if(dia<10) out+="0";
        out += dia+"/";
        if(mes<10) out+="0";
        out += mes;
        return out;
    }
    public String getData(){
        String out = getAniversário()+"/"+ano;
        return out;
    }
    
    public void printData(){
        System.out.println(getData());
    }
}