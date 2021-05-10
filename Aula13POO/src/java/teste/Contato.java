/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

/**
 * Classe para manipula uma lista de contatos
 * 
 * @author rlarg
 */
public class Contato {
    private String nome;
    private String tefone;
    private Data nascimento;

    public Contato(String nome, String tefone, Data nascimento) {
        this.nome = nome;
        this.tefone = tefone;
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

    public String getTefone() {
        return tefone;
    }

    public void setTefone(String tefone) {
        this.tefone = tefone;
    }
    
}