package com.sbc.project.model;

import java.util.Arrays;

public class CaminhoBExtra {
    private String metodo;
    private String [] caminho;
    private String totaleval;
    private String [] cliente;

    public CaminhoBExtra() {
    }

    public CaminhoBExtra(String metodo, String[] caminho, String totaleval, String[] cliente) {
        this.metodo = metodo;
        this.caminho = caminho;
        this.totaleval = totaleval;
        this.cliente = cliente;
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

    public String[] getCliente() {
        return cliente;
    }

    public void setCliente(String[] cliente) {
        this.cliente = cliente;
    }

    @Override
    public String toString() {
        return "CaminhoBExtra{" +
                "metodo='" + metodo + '\'' +
                ", caminho=" + Arrays.toString(caminho) +
                ", totaleval='" + totaleval + '\'' +
                ", cliente=" + Arrays.toString(cliente) +
                '}';
    }
}

