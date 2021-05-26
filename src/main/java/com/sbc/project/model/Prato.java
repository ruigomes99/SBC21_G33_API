package com.sbc.project.model;

public class Prato {
    private String nome;
    private String duracaoMin;
    private String duracaoMax;
    private String preco;
    private String restaurante;
    private String classificacao;
    private String localizacao;
    private String categoria;
    private String extras;
    private String bebida;
    private String imagem;
    private String probabilidade;

    public Prato() {
    }

    public Prato(Prato prato) {
        this.nome = prato.getNome();
        this.duracaoMin = prato.getDuracaoMin();
        this.duracaoMax = prato.getDuracaoMax();
        this.preco = prato.getPreco();
        this.restaurante = prato.getRestaurante();
        this.classificacao = prato.getClassificacao();
        this.localizacao = prato.getLocalizacao();
        this.categoria = prato.getCategoria();
        this.extras = prato.getExtras();
        this.bebida = prato.getBebida();
        this.imagem = prato.getImagem();
        this.probabilidade = prato.getProbabilidade();
    }

    public Prato(String nome, String duracaoMin, String duracaoMax, String preco, String restaurante, String classificacao, String localizacao, String categoria, String extras, String bebida, String imagem, String probabilidade) {
        this.nome = nome;
        this.duracaoMin = duracaoMin;
        this.duracaoMax = duracaoMax;
        this.preco = preco;
        this.restaurante = restaurante;
        this.classificacao = classificacao;
        this.localizacao = localizacao;
        this.categoria = categoria;
        this.extras = extras;
        this.bebida = bebida;
        this.imagem = imagem;
        this.probabilidade = probabilidade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDuracaoMin() {
        return duracaoMin;
    }

    public void setDuracaoMin(String duracaoMin) {
        this.duracaoMin = duracaoMin;
    }

    public String getDuracaoMax() {
        return duracaoMax;
    }

    public void setDuracaoMax(String duracaoMax) {
        this.duracaoMax = duracaoMax;
    }

    public String getPreco() {
        return preco;
    }

    public void setPreco(String preco) {
        this.preco = preco;
    }

    public String getRestaurante() {
        return restaurante;
    }

    public void setRestaurante(String restaurante) {
        this.restaurante = restaurante;
    }

    public String getClassificacao() {
        return classificacao;
    }

    public void setClassificacao(String classificacao) {
        this.classificacao = classificacao;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
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

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getProbabilidade() {
        return probabilidade;
    }

    public void setProbabilidade(String probabilidade) {
        this.probabilidade = probabilidade;
    }

    @Override
    public String toString() {
        return "Prato{" +
                "nome='" + nome + '\'' +
                ", duracaoMin='" + duracaoMin + '\'' +
                ", duracaoMax='" + duracaoMax + '\'' +
                ", preco='" + preco + '\'' +
                ", restaurante='" + restaurante + '\'' +
                ", classificacao='" + classificacao + '\'' +
                ", localizacao='" + localizacao + '\'' +
                ", categoria='" + categoria + '\'' +
                ", extras='" + extras + '\'' +
                ", bebida='" + bebida + '\'' +
                ", imagem='" + imagem + '\'' +
                ", probabilidade='" + probabilidade + '\'' +
                '}';
    }
}
