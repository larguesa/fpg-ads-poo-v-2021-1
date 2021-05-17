/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.fatecpg.web;

import java.util.ArrayList;

/**
 *
 * @author rlarg
 */
public class Database {
    private static ArrayList<User> users;
    
    public static ArrayList<User> getUsers(){
        if(users == null){
            users = new ArrayList<>();
            users.add(
                    new User(
                            "Administrador", 
                            "admin@domain.com", 
                            "1234".hashCode()
                    )
            );
            users.add(
                    new User(
                            "Fulano da Silva", 
                            "fulano@domain.com", 
                            "1234".hashCode()
                    )
            );
        }
        return users;
    }
    
    public static User getUser(String email){
        if(email == null) return null;
        for(User user: getUsers()){
            if(user.getEmail().equals(email)){
                return user;
            }
        }
        return null;
    }
    
    public static void addUser(User newUser){
        users.add(newUser);
    }
    public static void removeUser(String email){
        if(email == null) return;
        for(int i=0; i< users.size(); i++){
            if(users.get(i).getEmail().equals(email)){
                users.remove(i);
            }
        }
    }
}