package com.sbc.project.model;

public class Pedido {
    private String tipo;
    private String preco;
    private String duracao;
    private String classificacao;
    private String categoria;
    private String extras;
    private String bebida;

    public Pedido() {
    }

    public Pedido(String tipo, String preco, String duracao, String classificacao, String categoria, String extras, String bebida) {
        this.tipo = tipo;
        this.preco = preco;
        this.duracao = duracao;
        this.classificacao = classificacao;
        this.categoria = categoria;
        this.extras = extras;
        this.bebida = bebida;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getPreco() {
        return preco;
    }

    public void setPreco(String preco) {
        this.preco = preco;
    }

    public String getDuracao() {
        return duracao;
    }

    public void setDuracao(String duracao) {
        this.duracao = duracao;
    }

    public String getClassificacao() {
        return classificacao;
    }

    public void setClassificacao(String classificacao) {
        this.classificacao = classificacao;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getExtras() {
        return extras;
    }

    public void setExtras(String extras) {
        this.extras = extras;
    }

    public String getBebida() {
        return bebida;
    }

    public void setBebida(String bebida) {
        this.bebida = bebida;
    }
}
