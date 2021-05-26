package com.sbc.project.model;

import java.util.Arrays;

public class CaminhoB {
    private String metodo;
    private String [] caminho;
    private String totaleval;

    public CaminhoB() {
    }

    public CaminhoB(String metodo, String[] caminho, String totaleval) {
        this.metodo = metodo;
        this.caminho = caminho;
        this.totaleval = totaleval;
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

    public String getTotaleval() {
        return totaleval;
    }

    public void setTotaleval(String totaleval) {
        this.totaleval = totaleval;
    }

    @Override
    public String toString() {
        return "CaminhoB{" +
                "metodo='" + metodo + '\'' +
                ", caminho=" + Arrays.toString(caminho) +
                ", totaleval='" + totaleval + '\'' +
                '}';
    }
}
