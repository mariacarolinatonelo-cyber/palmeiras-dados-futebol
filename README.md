# palmeiras-dados-futebol
Banco de dados relacional estruturado em SQLite para análise de desempenho e estatísticas do Palmeiras entre 2021 e 2024.
# ⚽ Análise de Dados e Estatísticas: Palmeiras (2021-2024)

## 📌 Sobre o Projeto
Este projeto foi desenvolvido com o objetivo de estruturar e analisar dados de desempenho do Palmeiras entre os anos de 2021 e 2024. A iniciativa nasceu da necessidade de aplicar conceitos práticos de modelagem de dados e consultas SQL em um cenário dinâmico.

Todo o levantamento, estruturação e normalização dos dados foram feitos do zero, transformando informações brutas em um banco de dados relacional completo em **SQLite**.

## 🗄️ Modelagem do Banco de Dados
O banco foi estruturado garantindo a normalização dos dados e o uso correto de chaves primárias e estrangeiras. Ele é composto por 5 tabelas interligadas:
* **jogador:** Dados cadastrais (nome, posição, nacionalidade, valor de mercado, etc.).
* **camisa:** Histórico de qual jogador usou qual número em cada ano.
* **jogos:** Registro das partidas (data, adversário, formação tática, mando de campo, cartões, etc.).
* **gols:** Registro detalhado dos gols marcados (tempo, número da camisa do marcador).
* **campeonato:** Competições disputadas.

### Diagrama Entidade-Relacionamento (DER)
Abaixo está o esquema desenhado durante o planejamento lógico do banco de dados:

![Diagrama DER](IMG_5829.jpeg)

## 📊 Consultas e Insights
O arquivo `analises_palmeiras.sql` contém extrações complexas desenvolvidas para responder a perguntas estatísticas e táticas, exigindo o uso avançado de junções relacionais (`JOINs`), agrupamentos (`GROUP BY`) e funções de agregação (`SUM`, `COUNT`, `AVG`). 

Algumas das análises codificadas incluem:
1. **O Artilheiro do Período:** Cruzamento de 4 tabelas para identificar quem marcou mais gols, resolvendo de forma lógica a variação dos números de camisa por ano.
2. **Tática e Eficiência:** Avaliação de qual esquema tático (formação) resultou no maior volume absoluto de vitórias.
3. **O Fator Casa vs. Cartões:** Impacto do mando de campo na média de faltas cometidas e cartões amarelos recebidos.

## 🛠️ Tecnologias e Habilidades Aplicadas
* **Linguagem:** SQL
* **SGBD:** SQLite
* **Competências:** Modelagem de Banco de Dados Relacional, Criação de DER, Análise de Dados, Consultas Complexas (Múltiplos JOINs) e Funções de Agregação.

* ## 📈 Resultados e Insights Analíticos

Com o banco de dados rodando e as consultas estruturadas, foi possível extrair algumas informações muito legais sobre o comportamento do time no período de 2021 até a metade de 2024. 

### 1. O Artilheiro do Período
**Objetivo:** Identificar os maiores goleadores cruzando o histórico rotativo de camisas com o cadastro de jogadores.

| Jogador | Total de Gols |
| :--- | :--- |
| Rafael Veiga | 65 |
| Rony | 54 |
| José Manuel López | 21 |
| Gustavo Scarpa | 21 |
| Gustavo Gómez | 21 |

> 💡 **Insight:** É muito interessante notar que, embora o Rony (centroavante) tenha muitos gols, quem lidera a lista é o Rafael Veiga (um meia). Além disso, o fato do zagueiro Gustavo Gómez estar empatado em terceiro lugar mostra que o time não depende apenas dos atacantes e tem um bom aproveitamento em bola parada.

### 2. Tática e Eficiência: Qual formação vence mais?
**Objetivo:** Medir a taxa de conversão em vitórias baseada na escalação inicial. *(Mostrando as 4 formações mais usadas).*

| Formação | Jogos Disputados | Total de Vitórias | Taxa de Sucesso |
| :--- | :--- | :--- | :--- |
| 4-2-3-1 | 149 | 93 | 62,4% |
| 4-3-3 | 21 | 12 | 57,1% |
| 3-4-1-2 | 20 | 13 | 65,0% |
| 3-5-2 | 19 | 11 | 57,8% |

> 💡 **Insight:** Fica claro que o 4-2-3-1 é o esquema "padrão" do time, sendo usado de longe na maior parte do tempo (149 jogos) com uma ótima taxa de vitórias (62,4%). No entanto, quando o time precisou usar a variação tática 3-4-1-2, teve uma eficiência ainda maior (65% de aproveitamento em 20 jogos), provando ser uma excelente carta na manga.

### 3. A Origem dos Gols (Gols por Posição)
**Objetivo:** Entender como a responsabilidade de marcar gols está distribuída pelo elenco.

| Posição | Total de Gols |
| :--- | :--- |
| Centroavante | 131 |
| Meia Ofensivo | 88 |
| Ponta Esquerda | 49 |
| Meia Central | 48 |
| Zagueiro | 43 |

> 💡 **Insight:** Os números batem exatamente com o perfil dos artilheiros. Os meias ofensivos (88 gols) ajudam a tirar bastante o peso das costas dos centroavantes. Outro dado que impressiona é a quantidade de gols vindos dos zagueiros (43 gols), evidenciando um estilo de jogo muito agressivo também nas defesas.

### 4. Desempenho por Adversário
**Objetivo:** Identificar contra quais times tivemos os melhores resultados e os maiores volumes de jogos.

| Adversário | Jogos Disputados | Vitórias | Taxa de Vitória |
| :--- | :--- | :--- | :--- |
| Santos | 12 | 9 | 75,0% |
| São Paulo | 22 | 6 | 27,2% |
| Cuiabá | 7 | 5 | 71,4% |
| Coríntios | 11 | 5 | 45,4% |
| Bragantino | 11 | 5 | 45,4% |

> 💡 **Insight:** O Santos foi o adversário que o time teve mais facilidade em vencer (9 vitórias em 12 jogos). Por outro lado, o São Paulo foi o rival que mais cruzou o caminho da equipe no período (22 jogos), resultando em confrontos muito mais equilibrados e com um número menor de vitórias.

### 5. Mando de Campo: Fator Casa vs. Faltas
**Objetivo:** Avaliar se jogar fora de casa deixa o time mais indisciplinado.

| Mando de Campo | Média de Faltas | Total de Amarelos |
| :--- | :--- | :--- |
| C (Casa) | 13,74 | 238 |
| F (Fora) | 13,89 | 247 |

> 💡 **Insight:** Surpreendentemente, os dados mostram que a postura do time é praticamente a mesma. A média de faltas (cerca de 13 por jogo) e o total de amarelos sofrem uma variação mínima. A equipe não se intimida ou bate mais apenas por estar jogando na casa do adversário.

### 6. Disciplina ao Longo do Tempo
**Objetivo:** Agrupar médias de faltas e cartões para entender a evolução do comportamento tático por temporada.

| Ano | Jogos | Média Faltas | Amarelos | Vermelhos |
| :--- | :--- | :--- | :--- | :--- |
| 2021 | 74 | 13,91 | 149 | 13 |
| 2022 | 74 | 12,46 | 123 | 9 |
| 2023 | 73 | 14,45 | 148 | 7 |
| 2024 | 27 | 15,59 | 65 | 0 |

> 💡 **Insight:** Observando o comportamento temporal, o ano de 2021 foi disparado o mais indisciplinado em termos de expulsões (13 cartões vermelhos). Um detalhe curioso é que, até o momento analisado em 2024, a média de faltas por jogo atingiu seu pico (15,59), mas a equipe não sofreu nenhum cartão vermelho, o que pode sugerir o uso de "faltas táticas" de forma mais inteligente.
