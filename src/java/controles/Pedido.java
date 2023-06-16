package controles;

import java.util.Date;
/**
 *
 * @author Gabriel Victor da Gama
 */
public class Pedido{
    //Atributos
    private int cod;
    private String nome;
    private String endereco;
    private String bairro;
    private String comida;
    private String obs;
    
    
    //Métodos - Construtor
    public Pedido(int cod, String nome, String endereco, String bairro, String comida, String obs) {
        this.cod = cod;
        this.nome = nome;
        this.endereco = endereco;
        this.bairro = bairro;
        this.comida = comida;
        this.obs = obs;
    }
    //Métodos - Get
    public int getCod() {
        return cod;
    }
    public String getNome() {
        return nome;
    }
    public String getEnd() {
        return endereco;
    }
    public String getBairro() {
        return bairro;
    }
    public String getComida() {
        return comida;
    }
    public String getObs() {
        return obs;
    }
    
    //Métodos - Set
    public void setCod(int cod) {
        this.cod = cod;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public void setEnd(String endereco) {
        this.endereco = endereco;
    }
    public void setBairro(String bairro) {
        this.bairro = bairro;
    }
    public void setComida(String comida) {
        this.comida = comida;
    }
    public void setObs(String obs) {
        this.obs = obs;
    }

    
    
}
