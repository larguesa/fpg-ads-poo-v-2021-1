/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import java.util.ArrayList;

/**
 *
 * @author rlarg
 */
public class Base {
    private static ArrayList<Contato> list;
    public static ArrayList<Contato> getContatos(){
        if(list == null){
            list = new ArrayList<>();
            list.add(new Contato
            ("Fulano", "+55 13 5555-0001", new Data(1, 1, 2000)));
            list.add(new Contato
            ("Beltrano", "+55 13 5555-0002", new Data(2, 1, 2000)));
            list.add(new Contato
            ("Cicrano", "+55 13 5555-0003", new Data(3, 1, 2000)));
        }
        return list;
    }
}