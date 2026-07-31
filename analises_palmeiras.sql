SELECT 
    j.nome, 
    COUNT(g.id_gol) AS total_gols
FROM gols g
JOIN jogos jo ON g.data = jo.data
JOIN camisa c ON g.numero = c.numero AND jo.ano = c.ano
JOIN jogador j ON c.id_jogador = j.id_jogador
GROUP BY j.nome
ORDER BY total_gols DESC
LIMIT 5;


SELECT 
    formacao, 
    COUNT(id_jogo) AS total_jogos_disputados,
    SUM(CASE WHEN v_e_d = 'vitória' THEN 1 ELSE 0 END) AS total_vitorias
FROM jogos
GROUP BY formacao
ORDER BY total_vitorias DESC;


SELECT 
    mando_de_campo, 
    AVG(faltas_cometidas) AS media_faltas,
    SUM(cartao_amarelo) AS total_amarelos
FROM jogos
GROUP BY mando_de_campo;

SELECT 
    j.posicao, 
    COUNT(g.id_gol) AS total_gols
FROM gols g
JOIN jogos jo ON g.data = jo.data
JOIN camisa c ON g.numero = c.numero AND jo.ano = c.ano
JOIN jogador j ON c.id_jogador = j.id_jogador
GROUP BY j.posicao
ORDER BY total_gols DESC;


SELECT 
    adversario, 
    COUNT(id_jogo) AS jogos_disputados,
    SUM(CASE WHEN UPPER(TRIM(v_e_d)) LIKE 'V%' THEN 1 ELSE 0 END) AS vitorias
FROM jogos
GROUP BY adversario
HAVING jogos_disputados > 3 -- Filtra para mostrar apenas times que enfrentou mais vezes
ORDER BY vitorias DESC
LIMIT 5;


SELECT 
    ano, 
    COUNT(id_jogo) AS total_jogos,
    ROUND(AVG(faltas_cometidas), 2) AS media_faltas_por_jogo,
    SUM(cartao_amarelo) AS total_amarelos,
    SUM(cartao_vermelho) AS total_vermelhos
FROM jogos
GROUP BY ano
ORDER BY ano ASC;

