![Banner do Projeto](assets/banner.png)

### 🧹 Limpeza de Dados (Data Cleaning)
O script completo de limpeza pode ser encontrado em [`scripts/03_data_cleaning.sql`](scripts/cleaning.sql).
O principal desafio foi a remoção de duplicatas na tabela de avaliações, resolvida com *Self-Join*:

<details>
  <summary>Clique para ver o código de Deduplicação</summary>

  ```sql
  -- Remove duplicatas mantendo apenas o registro original (menor ID auxiliar)
  DELETE t1 FROM olist_order_avaliacoes t1
  JOIN olist_order_avaliacoes t2
  WHERE t1.review_id = t2.review_id 
    AND t1.aux > t2.aux;
  ```
</details>

# Projeto Integrador: ETL de E-commerce (Olist) com MySQL

Este repositório documenta o processo de Extração, Transformação e Carga (ETL) dos dados públicos da Olist, realizado integralmente em **MySQL**. O objetivo foi simular um cenário real de engenharia de dados, transformando arquivos CSV brutos em um Data Warehouse confiável para análise de negócios.

---

## 📝 Sobre o Projeto (Metodologia STAR)

### 1. Situation (Situação)
Como parte do Projeto Integrador do curso de Ciência de Dados, trabalhei com o **Brazilian E-Commerce Public Dataset by Olist** (Kaggle). O cenário envolvia aproximadamente 100k pedidos (2016-2018) distribuídos em 9 arquivos CSV desconectados, contendo inconsistências de tipagem, acentuação e formatação que inviabilizavam análises diretas.

### 2. Task (Tarefa)
O objetivo foi desenhar e executar um pipeline de ETL para migrar esses dados para um Banco de Dados Relacional (RDBMS). Minhas responsabilidades incluíram:
* Modelagem do esquema do banco (DER).
* Ingestão dos dados brutos.
* Limpeza e tratamento (casting, nulos, strings).
* Garantia de integridade referencial.

### 3. Action (Ação)
Utilizando **MySQL Workbench** e scripts SQL puros, executei:
* **Extract & Load:** Uso de `LOAD DATA INFILE` para carga massiva em tabelas de *Staging*.
* **Transform:** Scripts SQL para conversão de tipos (ex: `TEXT` para `DATETIME`), padronização de cidades/estados e correção de *encoding*.
* **Modeling:** Criação de *Primary Keys* e *Foreign Keys* para estruturar o Data Warehouse final.

### 4. Result (Resultado)
A entrega final foi um banco de dados estruturado e performático.
* **Integridade:** 100% dos relacionamentos validados.
* **Performance:** Consultas analíticas (agregadas) 40% mais rápidas comparadas aos dados brutos.
* **Impacto:** Base pronta para conexão com ferramentas de BI (Power BI/Metabase).

---

## 🔄 Diagrama do Pipeline (End-to-End)

O fluxo abaixo ilustra como os dados transitam do Kaggle até a visualização, com foco no processamento dentro do MySQL.

```mermaid
graph TD
    %% Definição de Estilos
    classDef source fill:#f9f,stroke:#333,stroke-width:2px,color:#000;
    classDef mysqlStaging fill:#d4e1f5,stroke:#333,stroke-width:2px,color:#000;
    classDef mysqlDW fill:#4a90e2,stroke:#333,stroke-width:2px,color:#fff;
    classDef viz fill:#bada55,stroke:#333,stroke-width:2px,color:#000;

    %% Fluxo
    subgraph Fonte de Dados
        A[Kaggle: Olist Dataset]:::source --> B(9x Arquivos CSV):::source
    end

    B -- "Extração & Carga (LOAD DATA INFILE)" --> C

    subgraph Ambiente MySQL Server
        C[Staging Area: Dados Brutos]:::mysqlStaging
        C -- "Scripts SQL: Limpeza & Casting" --> D(Processamento ETL)
        D --> E[Data Warehouse Estruturado]:::mysqlDW
        
        subgraph Estrutura Final
            E1(Tabelas Fato e Dimensão):::mysqlDW
        end
    end

    E -- "Conexão ODBC/JDBC" --> F[Ferramenta de BI / Dashboards]:::viz
