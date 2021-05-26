package com.sbc.project.controller;

import com.sbc.project.ProjectApplication;
import com.sbc.project.model.*;
import org.springframework.web.bind.annotation.*;
import org.jpl7.*;

import java.lang.Integer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "http://127.0.0.1:5500", maxAge = 3600)
@RestController
@RequestMapping(value = "/api")
public class AppController {

    @GetMapping("/")
    public String listarPedido() {
        return "Página Inicial";
    }

    @GetMapping("/restart")
    public void restart() {
        ProjectApplication.restart();
    }

    // ELIMINAR IMPORT E MODEL PEDIDO
    @GetMapping("/tarefa-a1/query")
    public List<Prato> listarPedidoA1(@RequestParam String preco, @RequestParam String idade, @RequestParam String estado_espirito, @RequestParam String classificacao, @RequestParam String categoria, @RequestParam String bebida, @RequestParam String tipo) {

        String currentPath = System.getProperty("user.dir");
        currentPath = currentPath.replace("\\", "/");
        Query q = new Query("consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/a1/recomendacao.pl').");
        System.out.println(q.hasSolution());
        String cmd = "assert(fact(" + preco + ")), assert(fact('" + idade + "')),  assert(fact('" + estado_espirito + "')),  assert(fact('" + classificacao + "')),  assert(fact('" + categoria + "')),  assert(fact(" + bebida + ")),  assert(fact(" + tipo + ")).";
        Query q2 = new Query(cmd);
        System.out.println(q2.hasSolution());
        Query q3 = new Query("consulta(P).");
        System.out.println(q3.hasSolution());
        Map<String, Term>[] res = q3.allSolutions();

        String lista = "";
        for (int i = 0; i < res.length; i++) {
            lista = String.valueOf(res[i].get("P"));
        }

        lista = lista.replace("', '", "");
        lista = lista.replace("['", "");
        String[] stringArr = lista.split("N3XT");
        Prato prato = new Prato();
        List<Prato> resposta = new ArrayList<Prato>();
        int count = 1;
        for (int i = 0; i < stringArr.length; i++) {
            switch (count) {
                case 1:
                    if (stringArr[i].length() > 14) {
                        if (i == 0) {
                            prato.setProbabilidade(stringArr[i].substring(2, 8));
                            stringArr[i] = stringArr[i].trim().substring(11);
                        } else {
                            prato.setProbabilidade(stringArr[i].substring(5, 11));
                            stringArr[i] = stringArr[i].trim().substring(14);
                        }
                    }
                    prato.setNome(stringArr[i].trim());
                    break;
                case 2:
                    prato.setDuracaoMin(stringArr[i].trim());
                    break;
                case 3:
                    prato.setDuracaoMax(stringArr[i].trim());
                    break;
                case 4:
                    prato.setPreco(stringArr[i].trim());
                    break;
                case 5:
                    prato.setRestaurante(stringArr[i].trim());
                    break;
                case 6:
                    prato.setClassificacao(stringArr[i].trim());
                    break;
                case 7:
                    prato.setLocalizacao(stringArr[i].trim());
                    break;
                case 8:
                    prato.setCategoria(stringArr[i].trim());
                    break;
                case 9:
                    prato.setImagem(stringArr[i].trim());
                    break;
                case 10:
                    prato.setExtras(stringArr[i].trim());
                    break;
                case 11:
                    prato.setBebida(stringArr[i].trim());
                    resposta.add(new Prato(prato));
                    count = 0;
                    break;
                default:
                    // code block
            }
            count++;
        }

        Query q4 = new Query("retractall(fact(X)).");
        System.out.println(q4.hasSolution());
        return resposta;
    }

    @GetMapping("/tarefa-a2/query")
    public String recomendamosA2(@RequestParam String sexo, @RequestParam String categoria, @RequestParam String tempo, @RequestParam String idade, @RequestParam String preco, @RequestParam String classificacao, @RequestParam String dieta) {

        String currentPath = System.getProperty("user.dir");
        currentPath = currentPath.replace("\\", "/");
        Query q = new Query("consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/a2/recomendacao_example3.pl').");
        System.out.println(q.hasSolution());
        String cmd = "classify([sexo=" + sexo + ",categorias=" + categoria + ",tempo=" + tempo + ",idade=" + idade + ",preco=" + preco + ",classificacao=" + classificacao + ",dieta=" + dieta + "],Class).";
        Query q2 = new Query(cmd);
        System.out.println(q2.hasSolution());
        Map<String, Term>[] res = q2.allSolutions();

        String resposta = "";
        if (res.length == 0) {
            resposta = "dataNotFound";
        } else {
            resposta = String.valueOf(res[res.length-1].get("Class"));
        }

        return resposta;
    }

    @GetMapping("/tarefa-b1-obj1/query")
    public Caminho caminhoB1Objet1(@RequestParam String cliente, @RequestParam String metodo) {

        String currentPath = System.getProperty("user.dir");
        currentPath = currentPath.replace("\\", "/");
        Query q = new Query("consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b1/solucao1.pl').");
        System.out.println(q.hasSolution());
        String cmd = "assert(goal(" + cliente + ")).";
        Query q2 = new Query(cmd);
        System.out.println(q2.hasSolution());
        String cmd2 = "search(" + metodo + ",Par,S).";
        Query q3 = new Query(cmd2);
        Map<String, Term> res = q3.oneSolution();
        String caminho = String.valueOf(res.get("S"));
        String caminhoOutput = String.valueOf(res.get("S"));
        caminhoOutput = caminhoOutput.replace("[", "");
        caminhoOutput = caminhoOutput.replace("]", "");
        caminhoOutput = caminhoOutput.replace(" ", "");
        String [] caminhoArray = caminhoOutput.split(",");

        Query q4 = new Query("somatempo(" + caminho + ",D)");
        Map<String, Term>[] res2 = q4.allSolutions();
        String tempo = String.valueOf(res2[0].get("D"));

        Query q5 = new Query("totallucro(" + caminho + ",L).");
        Map<String, Term>[] res3 = q5.allSolutions();
        String lucro = String.valueOf(res3[0].get("L"));

        String passos = Integer.toString(caminhoArray.length - 1);

        Caminho resultado = new Caminho(metodo, caminhoArray, passos, tempo, lucro);
        Query q6 = new Query("retractall(goal(X)).");
        System.out.println(q6.hasSolution());
        return resultado;
    }

    @GetMapping("/tarefa-b1-obj2/query")
    public Caminho caminhoB1Objet2(@RequestParam String clienteA, @RequestParam String clienteB, @RequestParam String metodo) {

        String currentPath = System.getProperty("user.dir");
        currentPath = currentPath.replace("\\", "/");
        Query q = new Query("consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b1/solucao2.pl').");
        System.out.println(q.hasSolution());
        String cmd = "assert(goal1(" + clienteA + ")), assert(goal2(" + clienteB + ")), assert(egoal([" + clienteA + ", " + clienteB + "])).";
        Query q2 = new Query(cmd);
        System.out.println(q2.hasSolution());
        String cmd2 = "search(" + metodo + ",Par,S).";
        Query q3 = new Query(cmd2);

        Map<String, Term> res = q3.oneSolution();
        Query q4 = new Query("last("+ res.get("S").toString() +",LS).");
        Map<String, Term> res2 = q4.oneSolution();
        String caminho = res2.get("LS").toString();
        String caminhoOutput = res2.get("LS").toString();
        caminhoOutput = caminhoOutput.replace("[", "");
        caminhoOutput = caminhoOutput.replace("]", "");
        caminhoOutput = caminhoOutput.replace(" ", "");
        String [] caminhoArray = caminhoOutput.split(",");

        Query q5 = new Query("somatempo(" + caminho + ",D)");
        Map<String, Term>[] res3 = q5.allSolutions();
        String tempo = String.valueOf(res3[0].get("D"));

        Query q6 = new Query("somaentrega(" + caminho + ",D)");
        Map<String, Term>[] res70 = q6.allSolutions();
        String somaentregas = String.valueOf(res70[0].get("D"));
        String tempototal = Integer.toString(Integer.parseInt(tempo) + Integer.parseInt(somaentregas));

        Query q7 = new Query("totallucro(" + caminho + ",L).");
        Map<String, Term>[] res4 = q7.allSolutions();
        String lucro = String.valueOf(res4[0].get("L"));

        String passos = Integer.toString(caminhoArray.length - 1);

        Caminho resultado = new Caminho(metodo, caminhoArray, passos, tempototal, lucro);
        Query q8 = new Query("retractall(goal1(X)).");
        System.out.println(q8.hasSolution());
        Query q9 = new Query("retractall(goal2(X)).");
        System.out.println(q9.hasSolution());
        Query q10 = new Query("retractall(egoal(X)).");
        System.out.println(q10.hasSolution());
        return resultado;
    }

    @GetMapping("/tarefa-b2-obj1/query")
    public CaminhoB caminhoB2Objet1(@RequestParam String clienteA, @RequestParam String metodo) {

        String currentPath = System.getProperty("user.dir");
        currentPath = currentPath.replace("\\", "/");
        String consult = "";
        String run = "";
        switch(metodo) {
            case "lucro":
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/obj2/resultadoA.pl').";
                run = "runA2(S, Totaleval).";
                // code block
                break;
            case "tempo":
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/obj2/resultadoB.pl').";
                run = "runB2(S, Totaleval).";
                // code block
                break;
            case "ambos":
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/obj2/resultadoC.pl').";
                run = "runC2(S, Totaleval).";
                // code block
                break;
            default:
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/obj2/resultadoA.pl').";
                run = "runA2(S, Totaleval).";
                // code block
        }
        Query q = new Query(consult);
        System.out.println(q.hasSolution());
        String cmd = "assert(destino(" + clienteA + ")).";
        Query q2 = new Query(cmd);
        System.out.println(q2.hasSolution());
        Query q3 = new Query(run);
        Map<String, Term> res = q3.oneSolution();
        String totaleval = res.get("Totaleval").toString();
        String caminhoOutput = res.get("S").toString();
        caminhoOutput = caminhoOutput.replace("[", "");
        caminhoOutput = caminhoOutput.replace("]", "");
        caminhoOutput = caminhoOutput.replace(" ", "");
        String [] caminhoArray = caminhoOutput.split(",");

        CaminhoB resultado = new CaminhoB(metodo, caminhoArray, totaleval);
        Query q8 = new Query("retractall(destino(X)).");
        System.out.println(q8.hasSolution());
        return resultado;
    }

    @GetMapping("/tarefa-b2-obj2/query")
    public CaminhoB caminhoB2Objet2(@RequestParam String clienteA, @RequestParam String clienteB, @RequestParam String metodo) {

        String currentPath = System.getProperty("user.dir");
        currentPath = currentPath.replace("\\", "/");
        String consult = "";
        String run = "";
        switch(metodo) {
            case "lucro":
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/obj2/resultadoA.pl').";
                run = "runA2(S, Totaleval).";
                // code block
                break;
            case "tempo":
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/obj2/resultadoB.pl').";
                run = "runB2(S, Totaleval).";
                // code block
                break;
            case "ambos":
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/obj2/resultadoC.pl').";
                run = "runC2(S, Totaleval).";
                // code block
                break;
            default:
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/obj2/resultadoA.pl').";
                run = "runA2(S, Totaleval).";
                // code block
        }
        Query q = new Query(consult);
        System.out.println(q.hasSolution());
        String cmd = "assert(destino([" + clienteA + "," + clienteB + "])).";
        Query q2 = new Query(cmd);
        System.out.println(q2.hasSolution());
        Query q3 = new Query(run);
        Map<String, Term> res = q3.oneSolution();
        String totaleval = res.get("Totaleval").toString();
        String caminhoOutput = res.get("S").toString();
        caminhoOutput = caminhoOutput.replace("[", "");
        caminhoOutput = caminhoOutput.replace("]", "");
        caminhoOutput = caminhoOutput.replace(" ", "");
        String [] caminhoArray = caminhoOutput.split(",");

        CaminhoB resultado = new CaminhoB(metodo, caminhoArray, totaleval);
        Query q8 = new Query("retractall(destino(X)).");
        System.out.println(q8.hasSolution());
        return resultado;
    }

    @GetMapping("/tarefa-b2-extra-obj1/query")
    public CaminhoBExtra caminhoB2ExtraObj1(@RequestParam String metodo) {

        String currentPath = System.getProperty("user.dir");
        currentPath = currentPath.replace("\\", "/");
        String consult = "";
        String run = "";
        switch(metodo) {
            case "lucro":
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/extra/obj1/resultadoA.pl').";
                run = "runA1(S, Totaleval, Cliente).";
                // code block
                break;
            case "ambos":
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/extra/obj1/resultadoC.pl').";
                run = "runC1(S, Totaleval, Cliente).";
                // code block
                break;
            default:
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/extra/obj1/resultadoA.pl').";
                run = "runA1(S, Totaleval, Cliente).";
                // code block
        }
        Query q = new Query(consult);
        System.out.println(q.hasSolution());
        Query q3 = new Query(run);
        Map<String, Term> res = q3.oneSolution();
        String totaleval = res.get("Totaleval").toString();
        String caminhoOutput = res.get("S").toString();
        String [] cliente = {res.get("Cliente").toString()};
        caminhoOutput = caminhoOutput.replace("[", "");
        caminhoOutput = caminhoOutput.replace("]", "");
        caminhoOutput = caminhoOutput.replace(" ", "");
        String [] caminhoArray = caminhoOutput.split(",");

        CaminhoBExtra resultado = new CaminhoBExtra(metodo, caminhoArray, totaleval, cliente);
        Query q8 = new Query("retractall(destino(X)).");
        System.out.println(q8.hasSolution());

        return resultado;
    }

    @GetMapping("/tarefa-b2-extra-obj2/query")
    public CaminhoBExtra caminhoB2ExtraObj2(@RequestParam String metodo) {

        String currentPath = System.getProperty("user.dir");
        currentPath = currentPath.replace("\\", "/");
        String consult = "";
        String run = "";
        switch(metodo) {
            case "lucro":
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/extra/obj2/resultadoA.pl').";
                run = "runA2(S, Totaleval, L).";
                // code block
                break;
            case "ambos":
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/extra/obj2/resultadoC.pl').";
                run = "runC2(S, Totaleval, L).";
                // code block
                break;
            default:
                consult = "consult('" + currentPath + "/src/main/java/com/sbc/project/prolog/b2/extra/obj2/resultadoA.pl').";
                run = "runA2(S, Totaleval, L).";
                // code block
        }
        Query q = new Query(consult);
        System.out.println(q.hasSolution());
        Query q3 = new Query(run);
        Map<String, Term> res = q3.oneSolution();
        String totaleval = res.get("Totaleval").toString();
        String caminhoOutput = res.get("S").toString();
        String clientes = res.get("L").toString();
        clientes = clientes.replace("[", "");
        clientes = clientes.replace("]", "");
        String[] outputClientes = clientes.split(",");
        for(int i = 0; i < outputClientes.length; i++) {
            outputClientes[i] = outputClientes[i].trim();
        }
        caminhoOutput = caminhoOutput.replace("[", "");
        caminhoOutput = caminhoOutput.replace("]", "");
        caminhoOutput = caminhoOutput.replace(" ", "");
        String [] caminhoArray = caminhoOutput.split(",");

        CaminhoBExtra resultado = new CaminhoBExtra(metodo, caminhoArray, totaleval, outputClientes);
        Query q8 = new Query("retractall(destino(X)).");
        System.out.println(q8.hasSolution());

        return resultado;
    }

}
