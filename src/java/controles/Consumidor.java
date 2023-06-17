/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controles;



/**
 *
 * @author Pedro Ventola
 */
public class Consumidor {   
    //atributos
    
    private String nome;
    private String cpf;
    private String telefone;
    private String endereco;
    private String email;
    
    //método construtor
    public Consumidor(String nome, String cpf, String telefone, String endereco, String email) {
        this.nome = nome;
        this.cpf = cpf;
        this.telefone = telefone;
        this.endereco = endereco;
        this.email = email;
    }

    // get e set
    public void setNome(String nome) { this.nome = nome; }

    public void setCpf(String cpf) { this.cpf = cpf; }

    public void setTelefone(String telefone) { this.telefone = telefone; }

    public void setEndereco(String endereco) { this.endereco = endereco;}
    
    public void setEmail(String email) { this.email = email;}
    

    
    public String getNome() { return nome; }

    public String getCpf() { return cpf; }

    public String getTelefone() { return telefone; }

    public String getEndereco() { return endereco; }
    
    public String getEmail() { return email; }
    
    
    
}
