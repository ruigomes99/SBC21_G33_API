package com.sbc.project.model;

import java.util.Arrays;

public class Caminho {
    private String metodo;
    private String [] caminho;
    private String passos;
    private String tempo;
    private String lucro;

    public Caminho() {
    }

    public Caminho(String metodo, String[] caminho, String passos, String tempo, String lucro) {
        this.metodo = metodo;
        this.caminho = caminho;
        this.passos = passos;
        this.tempo = tempo;
        this.lucro = lucro;
    }

    public String getMetodo() {
        return metodo;
    }

    public void setMetodo(String metodo) {
        this.metodo = metodo;
    }

    public String[] getCaminho() {
        return caminho;
    }

    public void setCaminho(String[] caminho) {
        this.caminho = caminho;
    }

    public String getPassos() {
        return passos;
    }

    public void setPassos(String passos) {
        this.passos = passos;
    }

    public String getTempo() {
        return tempo;
    }

    public void setTempo(String tempo) {
        this.tempo = tempo;
    }

    public String getLucro() {
        return lucro;
    }

    public void setLucro(String lucro) {
        this.lucro = lucro;
    }

    @Override
    public String toString() {
        return "Caminho{" +
                "metodo='" + metodo + '\'' +
                ", caminho=" + Arrays.toString(caminho) +
                ", tamanho='" + passos + '\'' +
                ", tempo='" + tempo + '\'' +
                ", lucro='" + lucro + '\'' +
                '}';
    }
}
