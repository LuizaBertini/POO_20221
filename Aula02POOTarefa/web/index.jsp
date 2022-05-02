<%-- 
    Document   : index
    Created on : 2 de mai. de 2022, 15:31:43
    Author     : Fatec
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="demo.Disciplina"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%

DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");


Disciplina GE = new Disciplina("AGR101", "Gestão de Equipes", "Vivência de técnicas de desenvolvimento de habilidades: liderança, criatividade, iniciativa, postura, atividades, entrevista, motivação, capacidade de síntese e de planejamento. Trabalho em equipe. Equipes de alto desempenho. Sistema de negociação. Instrumentos e atitudes de resolução de conflitos. Controles e atitudes gerenciais. Ações corretivas e preventivas.", "Quinta-Feira", "19h-20:40h");
Disciplina EMP = new Disciplina("CEE002", "Empreendedorismo", "Conceitos sobre empreendedorismo. Características e habilidades do empreendedor. O comportamento empreendedor: análise de oportunidades. O processo de geração de idéias e conceito de negócios. Meios para análise de oportunidades e idéias. Estratégia de negócios. Aspectos de planejamento, abertura, funcionamento e gerenciamento de um negócio. Instituições de apoio e financiamento. Desenvolvimento de planos de negócio.", "Sábado", "13:30h-15h");
Disciplina IA = new Disciplina("IIA002", "Inteligência Artificial", "Fundamentos e paradigmas da Inteligência Artificial (IA). Técnicas de IA aplica¬das à so¬lução de problemas. Sistemas baseados em conhecimento, planejamento e aprendizagem.", "Quarta-Feira", "19h-22:30h");
Disciplina POO = new Disciplina("ILP007", "Programação Orientada a Objetos", "Conceitos e evolução da tecnologia de orientação a objetos. Limitações e diferenças entre o paradigma da programação estruturada em relação à orientação a objetos. Conceito de objeto, classe, métodos, atributos, herança, polimorfismo, agregação, associação, dependência, encapsulamento, mensagem e suas respectivas notações na linguagem padrão de representação da orientação a objetos. Implementação de algoritmos orientado a objetos utilizando linguagens de programação. Aplicação e uso das estruturas fundamentais da orientação a objetos.", "Segunda-Feira", "13:10h-16:40h");
Disciplina GG = new Disciplina("ITI004", "Gestão e Governança de TI", "Planejamento estratégico e o alinhamento entre o negócio e o uso da TI. Balanced Scorecard do negócio e de TI. Planejamento de sistemas e da infra-estrutura de TI. Governança corporativa e governança de TI. Frameworks de melhores práticas em TI (COBIT, ITIL, NBR-ISO/IEC 17799 e 27001 etc.). Catálogo de serviços de TI e acordo de níveis de serviço (SLA). Custos de TI. Segurança em TI. Auditoria de Sistemas.", "Segunda-Feira", "19h-22:30h");
Disciplina TG = new Disciplina("TTG103", "Trabalho de Graduação", "O estudante elaborará e apresentará, sob a orientação de docente, um Trabalho de Graduação, e o apresentará perante uma banca examinadora. Nos cursos onde há disciplinas de Projetos as mesmas deverão subsidiar o trabalho de graduação, com temas e propostas de projetos, casos, etc.", "Quinta-Feira", "20:50h-22:30h");

ArrayList<Disciplina> lista = new ArrayList<>();
lista.add(GE); 
lista.add(EMP);
lista.add(IA);
lista.add(POO);
lista.add(GG);
lista.add(TG);

%>

<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
    </head>
    <body>
        <h3>Maria Luiza Bertini</h3>
        <h3>RA: 1290481923005</h3>
        <h3>Horário atual: <%= dtf.format(LocalDateTime.now())%></h3>
        <hr/>
        <h2>Minhas Disciplinas</h2>
        <div>
            <table border="1">
                <tr>
                    <th>Sigla</th>
                    <th>Disciplina</th>
                    <th>Ementa</th>
                    <th>Dia da Semana</th>
                    <th>Horário</th>
                </tr>
                <%for(Disciplina d : lista){%>
                <tr>
                    <td><%= d.getSigla()%></td>
                    <td><%= d.getNome()%></td>
                    <td><%= d.getEmenta()%></td>
                    <td><%= d.getDia_semana()%></td>
                    <td><%= d.getHorario()%></td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
