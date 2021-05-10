/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

/**
 *
 * @author rlarg
 */
public class Main {
    public static void main(String[] args) {
        Data hoje = new Data(10,5,2021);
        Data amanhã = new Data(11,5,2021);
        Data nasc = new Data();
        nasc.setAno(1979);
        nasc.setMes(7);
        nasc.setDia(1);
        
        hoje.printData();
        amanhã.printData();
        nasc.printData();
    }
}
