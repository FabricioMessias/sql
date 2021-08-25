--EXEMPLOS DE CONSULTAS SQL

--Consulta simples
SELECT * FROM CELULAR

--Consulta de alguns campos
select cod_CELULAR, MODELO 
FROM CELULAR

--WHERE
SELECT * FROM CELULAR
WHERE modelo = 'S4'

--BETWEEN (ENTRE)
SELECT * FROM CELULAR
WHERE cod_celular BETWEEN 4 AND 6
SELECT * FROM CELULAR
WHERE cod_celular >= 4 AND cod_celular >= 6

--IN (LISTA)
SELECT * FROM CELULAR
WHERE COD_CLIENTE IN (1,2,7)

--LIKE 
SELECT * FROM CELULAR
WHERE modelo LIKE 'S%'
SELECT * FROM CELULAR
WHERE modelo LIKE '%S%'

--Selecione todos os campos da tabela funcionario que tenha a letra A no nome
SELECT * FROM FUNCIONARIO
WHERE nome_funcionario LIKE '%A%'

--Selecione todos os campos da tabela funcionario que comecem com a letra A no nome
SELECT * FROM FUNCIONARIO
WHERE nome_funcionario LIKE 'A%'

--Selecione todos os campos da tabela funcionario que comecem com C, tenha quaisquer 4 caracteres no meio e termine com S
SELECT * FROM FUNCIONARIO
WHERE nome_funcionario LIKE 'CS'

--Selecione todos os campos da tabela funcionario que comecem com C, tenha uma quantidade indefinida de caracteres no meio e termine com S
SELECT * FROM FUNCIONARIO
WHERE nome_funcionario LIKE 'C%' AND nome_funcionario LIKE '%S'

--Busca todos os celulares com cod_marca nulos
SELECT * FROM CELULAR
WHERE cod_marca IS NULL

--Cria novo campo com desconto de 10% no preco_atual da peça
SELECT * , preco_atual * 0.9 AS NOVO_PRECO
FROM PECA

--Arredondamento
SELECT * , ROUND(preco_atual * 0.9,2) AS NOVO_PRECO
FROM PECA

--Adiciona o TEXTO NOME antes de cada nome de cada funcionario
SELECT *, 'NOME: ' + nome_funcionario AS NOVO_NOME
FROM FUNCIONARIO

--Coloca NOME DO FUNCIONARIO em maiusculas
SELECT * , UPPER(NOME_FUNCIONARIO)
FROM FUNCIONARIO

--Tira espacos antes do nome
SELECT *, LTRIM(NOME_FUNCIONARIO)
FROM FUNCIONARIO

--Tira espacos antes e depois do nome
SELECT *, RTRIM(LTRIM(NOME_FUNCIONARIO))
FROM FUNCIONARIO

--Puxa 5 primeiros caracteres do nome do funcionario
SELECT *, SUBSTRING(NOME_FUNCIONARIO,1,5)
FROM FUNCIONARIO

--Puxa caracteres do 3 ao 13 do funcionario
SELECT *, SUBSTRING(NOME_FUNCIONARIO,3,10)
FROM FUNCIONARIO

--Inverte nome do funcionario
SELECT *, REVERSE(NOME_FUNCIONARIO) FROM FUNCIONARIO

--Tamanho do nome do funcionario
SELECT *, LEN(NOME_FUNCIONARIO) FROM FUNCIONARIO

--Retorna um inteiro de onde está a letra A no nome do funcionario
SELECT *, CHARINDEX('A',nome_funcionario)
FROM FUNCIONARIO

--Retorna um inteiro de onde está a ultima letra A no nome do funcionario
SELECT *, CHARINDEX('A',REVERSE(NOME_FUNCIONARIO))
FROM FUNCIONARIO

--Ordena tabela de funcionarios alfabeticamente pelo nome do funcionario
SELECT * FROM FUNCIONARIO
ORDER BY nome_funcionario

--Ordena tabela de funcionarios alfabeticamente pelo ativo e depois pelo nome do funcionario
SELECT * FROM FUNCIONARIO
ORDER BY FUNCIONARIO_ATIVO, NOME_FUNCIONARIO

--Ordena tabela de funcionarios ordenando pelo codigo do funcionario descendente
SELECT * FROM FUNCIONARIO
ORDER BY cod_funcionario

--Puxa a DATA do servidor
SELECT GETDATE()

--Adiciona 15 dias a data do servidor
SELECT GETDATE() +15
SELECT DATEADD(DD,15,GETDATE())

--Subtrai um ano à data do servidor
SELECT DATEADD(YY,-1,GETDATE())

--Diferença entre datas
SELECT CONVERT(DATETIME,'20150101'), CONVERT(DATETIME,'20150315')
SELECT DATEDIFF(DD,'20150101','20150315')
SELECT DATEDIFF(DD,GETDATE(),'20150101')
SELECT *, DATEDIFF(DD,DATA_SERVICO,GETDATE())
FROM SERVICO

--DATANAME
SELECT DATENAME(MM,GETDATE())
SELECT DATENAME(DW,GETDATE())
SELECT *, DATENAME(MM,DATA_SERVICO)
FROM SERVICO

--Conversão de datas
SELECT *, CONVERT(VARCHAR,DATA_SERVICO,103)
FROM SERVICO
01/03/2014
SELECT *, CONVERT(VARCHAR,DATA_SERVICO,108)
FROM SERVICO
08:00:00
SELECT *, CONVERT(VARCHAR,DATA_SERVICO,112)
FROM SERVICO
20140112

--Somente parte da data
SELECT *,DATEPART(HH,DATA_SERVICO)
FROM SERVICO

--Montando datas
SELECT *, CONVERT(VARCHAR,DATA_SERVICO,112) + ' 09:15:15.120'
FROM SERVICO
20140301 09:15:15.120

--Remove duplicadas do campo ativo de funcionarios
SELECT DISTINCT(COD_FUNCIONARIO) FROM SERVICO
SELECT * FROM SERVICO

--União de SELECTS
SELECT 'JANEIRO', 1
UNION
SELECT 'FEVEREIRO', 2
SELECT NOME_FUNCIONARIO FROM FUNCIONARIO
UNION
SELECT NOME_MARCA FROM MARCA
SELECT DATENAME(MM,GETDATE()-60)
UNION
SELECT DATENAME(MM,GETDATE()-30)
UNION
SELECT DATENAME(MM,GETDATE())
UNION
SELECT DATENAME(MM,GETDATE()+30)
UNION
SELECT DATENAME(MM,GETDATE()+60)
SELECT * 
FROM SERVICO
LEFT JOIN FUNCIONARIO ON 
SERVICO.cod_funcionario = FUNCIONARIO.COD_FUNCIONARIO
LEFT JOIN CELULAR ON
SERVICO.cod_celular = CELULAR.COD_CELULAR
WHERE nome_funcionario LIKE '%JO%'
SELECT * FROM CIDADE
LEFT JOIN ESTADO ON CIDADE.COD_ESTADO = ESTADO.COD_ESTADO
SELECT * FROM CLIENTE
LEFT JOIN CIDADE ON CLIENTE.COD_CIDADE = CIDADE.COD_CIDADE
LEFT JOIN ESTADO ON CIDADE.COD_ESTADO = ESTADO.COD_ESTADO
SELECT CLIENTE.*, NOME_CIDADE, NOME_ESTADO 
FROM CLIENTE 
LEFT JOIN CIDADE ON CLIENTE.COD_CIDADE = CIDADE.COD_CIDADE
LEFT JOIN ESTADO ON CIDADE.COD_ESTADO = ESTADO.COD_ESTADO
SELECT * FROM FUNCIONARIO

--INSERIR NOVO FUNCIONÁRIO POR COMANDO
INSERT INTO FUNCIONARIO
(
nome_funcionario,
registro,
funcionario_ativo
)
VALUES
(
'MARIA DA FATEC',
'21215454',
1
)

--Atualizar registro da MARIA, corrigindo o nome
BEGIN TRAN
UPDATE FUNCIONARIO
SET nome_funcionario = 'MARIA DOS SANTOS',
REGISTRO = 875487
WHERE cod_funcionario = 16
COMMIT
ROLLBACK

--Atualizando toda a tabela
UPDATE FUNCIONARIO
SET registro = 548787
SELECT * FROM FUNCIONARIO

--Ativando dois primeiros funcionários
UPDATE FUNCIONARIO
SET FUNCIONARIO_ATIVO = 0
WHERE cod_funcionario <=2

--Excluir registro
DELETE FROM FUNCIONARIO
WHERE nome_funcionario = 'MARIA DOS SANTOS'
SELECT * FROM FUNCIONARIO

--CONTROL Z
BEGIN TRAN
DELETE FROM SERVICO_PECA
SELECT * FROM SERVICO_PECA
ROLLBACK -- VOLTAR ATRÁS
COMMIT -- ACEITAR AS ALTERAÇÕES FEITAS
SELECT * FROM SERVICO_PECA

--Corrigir registros 7 e 8 das ultimas peças vendidas, retirando 5 reais de cada
UPDATE SERVICO_PECA 
SET preco_vendido = preco_vendido - 5
WHERE cod_servico_peca IN (7,8)

--Ultimas três peças vendidas, exibindo o nome da peça e data da venda em formato DD/MM/AAAA
SELECT TOP 3 *, CONVERT(VARCHAR,DATA_SERVICO,103)
FROM SERVICO_PECA
LEFT JOIN PECA ON SERVICO_PECA.COD_PECA = PECA.COD_PECA
LEFT JOIN SERVICO ON SERVICO_PECA.COD_SERVICO = SERVICO.COD_SERVICO
ORDER BY DATA_SERVICO DESC

--Lista de todos os funcionários que fizeram vendas para os clientes do estado de São Paulo, exibindo o nome dos funcionários, removendo os duplicados
SELECT DISTINCT NOME_FUNCIONARIO FROM SERVICO
LEFT JOIN Funcionario ON SERVICO.COD_FUNCIONARIO = Funcionario.COD_FUNCIONARIO
LEFT JOIN CELULAR ON CELULAR.COD_CELULAR = SERVICO.COD_CELULAR
LEFT JOIN cliente ON CELULAR.COD_CLIENTE = cliente.COD_CLIENTE
LEFT JOIN CIDADE ON cliente.COD_CIDADE = CIDADE.COD_CIDADE
LEFT JOIN ESTADO ON CIDADE.COD_ESTADO = ESTADO.COD_ESTADO
WHERE NOME_ESTADO = 'São Paulo'

--Peças vendidas para cada clientes, exibindo o nome da peça, nome do cliente e há quantos dias o serviço foi realizado
SELECT NOME_PECA, NOME_CLIENTE, DATA_SERVICO, DATEDIFF(DD,DATA_SERVICO,GETDATE()), GETDATE()
FROM SERVICO_PECA
LEFT JOIN SERVICO ON SERVICO_PECA.COD_SERVICO = SERVICO.COD_SERVICO
LEFT JOIN CELULAR ON SERVICO.COD_CELULAR = CELULAR.COD_CELULAR 
LEFT JOIN cliente ON CELULAR.COD_CLIENTE = cliente.COD_CLIENTE
LEFT JOIN PECA ON SERVICO_PECA.COD_PECA = PECA.COD_PECA

--Criação de VIEW com dados de clientes
CREATE VIEW VW_CLIENTE
AS
SELECT 
CLIENTE.*,
CIDADE.NOME_CIDADE,
CIDADE.ATIVO_CIDADE,
CIDADE.COD_ESTADO,
ESTADO.NOME_ESTADO,
ESTADO.ATIVO_ESTADO
FROM CLIENTE
LEFT JOIN CIDADE ON CLIENTE.COD_CIDADE = CIDADE.COD_CIDADE
LEFT JOIN ESTADO ON CIDADE.COD_ESTADO = ESTADO.COD_ESTADO

--Consulta dados da VIEW
SELECT * FROM VW_CLIENTE

--Quantos serviços registrados
SELECT * FROM SERVICO
SELECT COUNT(*) FROM SERVICO

--Quantos funcionários cadastrados
SELECT COUNT(*) FROM FUNCIONARIO

--Quantos funcionários com nome ZÉ
SELECT COUNT(*) SOMA_ZE FROM FUNCIONARIO
WHERE nome_funcionario LIKE '%ZÉ%'

--Média de valor de servico
SELECT * FROM SERVICO
SELECT AVG(VALOR_SERVICO) FROM SERVICO
SELECT AVG(VALOR_SERVICO) FROM SERVICO
WHERE descricao = 'LIMPEZA'

--Servico com valor mais alto
SELECT MAX(VALOR_SERVICO) FROM SERVICO

--Servico com valor mais baixo
SELECT MIN(VALOR_SERVICO) FROM SERVICO

--Valor total de servicos vendidos
SELECT SUM(VALOR_SERVICO) FROM SERVICO

--Média de valor de serviço para celulares do modelo x10
SELECT AVG(VALOR_SERVICO) 
FROM SERVICO
LEFT JOIN CELULAR ON SERVICO.cod_celular = CELULAR.COD_CELULAR
WHERE CELULAR.modelo = 'x10'
SELECT * FROM VW_SERVICO

--Soma dos valores de todos os serviços
SELECT SUM(VALOR_SERVICO) FROM VW_SERVICO

--Soma dos valores de todos os serviços agrupado por funcionário
SELECT SUM(VALOR_SERVICO), NOME_FUNCIONARIO
FROM VW_SERVICO
GROUP BY NOME_FUNCIONARIO

--Quantos serviços registrados
SELECT COUNT(*) FROM SERVICO

--Quantos serviços registrados por cliente
SELECT COUNT(*) , NOME_CLIENTE
FROM VW_SERVICO
GROUP BY NOME_CLIENTE

--Média de valor de servico
SELECT AVG(VALOR_SERVICO) FROM SERVICO

--Média de valor de servico por cidade
SELECT AVG(VALOR_SERVICO), NOME_CIDADE
FROM VW_SERVICO
GROUP BY NOME_CIDADE

--Servico com valor mais alto
SELECT MAX(VALOR_SERVICO) FROM SERVICO

--Servico com valor mais alto por marca e por cidade
SELECT MAX(VALOR_SERVICO), NOME_MARCA, NOME_CIDADE
FROM VW_SERVICO
GROUP BY NOME_MARCA, NOME_CIDADE

--Servico com valor mais baixo
SELECT MIN(VALOR_SERVICO) FROM SERVICO

--Servico com valor mais baixo por funcionario
SELECT MIN(VALOR_SERVICO) , NOME_FUNCIONARIO
FROM VW_SERVICO
GROUP BY NOME_FUNCIONARIO
SELECT * FROM VW_SERVICO

--Soma dos valores de todos os serviços
SELECT SUM(VALOR_SERVICO) FROM VW_SERVICO

--Soma dos valores de todos os serviços agrupado por funcionário
SELECT SUM(VALOR_SERVICO), NOME_FUNCIONARIO
FROM VW_SERVICO
GROUP BY NOME_FUNCIONARIO

--Quantos serviços registrados
SELECT COUNT(*) FROM SERVICO

--Quantos serviços registrados por cliente
SELECT COUNT(*) , NOME_CLIENTE
FROM VW_SERVICO
GROUP BY NOME_CLIENTE

--Média de valor de servico
SELECT AVG(VALOR_SERVICO) FROM SERVICO

--Média de valor de servico por cidade
SELECT AVG(VALOR_SERVICO), NOME_CIDADE
FROM VW_SERVICO
GROUP BY NOME_CIDADE

--Servico com valor mais alto por marca e por cidade
SELECT MAX(VALOR_SERVICO), NOME_MARCA, NOME_CIDADE
FROM VW_SERVICO
GROUP BY NOME_MARCA, NOME_CIDADE

--Servico com valor mais baixo por funcionario
SELECT MIN(VALOR_SERVICO) , NOME_FUNCIONARIO
FROM VW_SERVICO
GROUP BY NOME_FUNCIONARIO

--Faça um SELECT que traga as colunas: primeiro nome de cada funcionário
SELECT *, 
SUBSTRING(NOME_FUNCIONARIO,1,CHARINDEX(' ',NOME_FUNCIONARIO)-1)
FROM FUNCIONARIO

--Quantidade de caracteres do nome completo
SELECT *, LEN(NOME_FUNCIONARIO) FROM FUNCIONARIO

--Posição da letra A no nome, se existir
SELECT *, CHARINDEX('A',NOME_FUNCIONARIO) FROM FUNCIONARIO

--Nome do funcionário com espaços da esquerda e direita cortados
SELECT *, RTRIM(LTRIM(NOME_FUNCIONARIO))
FROM FUNCIONARIO

--Crie o login do usuário, considerando o ultimo nome + a primeira letra do primeiro nome. 
--Exemplo: Anne da Silva – Login = silva.a
SELECT *, 
REVERSE(NOME_FUNCIONARIO),
CHARINDEX(' ',REVERSE(NOME_FUNCIONARIO)),
SUBSTRING(REVERSE(NOME_FUNCIONARIO),1,CHARINDEX(' ',REVERSE(NOME_FUNCIONARIO))),
REVERSE(SUBSTRING(REVERSE(NOME_FUNCIONARIO),1,CHARINDEX(' ',REVERSE(NOME_FUNCIONARIO)))),
REVERSE(SUBSTRING(REVERSE(NOME_FUNCIONARIO),1,CHARINDEX(' ',REVERSE(NOME_FUNCIONARIO))))+'.',
REVERSE(SUBSTRING(REVERSE(NOME_FUNCIONARIO),1,CHARINDEX(' ',REVERSE(NOME_FUNCIONARIO))))+'.'+SUBSTRING(NOME_FUNCIONARIO,1,1) 
FROM FUNCIONARIO
sILVA

--SELECT que traga o preço de cada serviço com um acréscimo de 3%, arredondados para 2 casas decimais, ordenados por CELULAR de forma ascendente
SELECT *, ROUND(VALOR_SERVICO * 1.03,2)
FROM SERVICO
ORDER BY COD_CELULAR

--Consulta que traga todos os funcionários que atenda a alguma destas condições:
-- * Nome comece com a letra A
-- * OU Tenha a letra t no nome
-- * OU tenha as letras J e A no nome
SELECT * 
FROM FUNCIONARIO
WHERE nome_funcionario LIKE 'A%'
OR nome_funcionario LIKE '%T%'
OR nome_funcionario LIKE '%J%A%'

--Faça uma consulta que traga as colunas:
-- * data do serviço em formato dd/mm/aaaa
-- * mês do serviço
-- * ano do serviço
-- * a data do serviço no formato yyyymmdd
-- * há quantos dias o serviço foi realizado, considerando a data atual do servidor
SELECT * ,
CONVERT(VARCHAR,DATA_SERVICO,103) DATA_SERVICO_BR,
MONTH(DATA_SERVICO) MES_SERVICO,
YEAR(DATA_SERVICO) ANO_SERVICO,
CONVERT(VARCHAR,DATA_SERVICO,112) DATA_YYYYMMDD,
DATEDIFF(DD,DATA_SERVICO,GETDATE())
FROM SERVICO

-- Faça um select que traga os serviços realizados nos últimos 7 dias.
SELECT * FROM SERVICO
WHERE DATEDIFF(DD,DATA_SERVICO,GETDATE()) <= 7

-- Faça um SELECT que traga todas as vendas realizadas em qualquer dia, entre às 12:00 e às 18:00
SELECT *
FROM SERVICO
WHERE DATEPART(HH,DATA_SERVICO) BETWEEN 12 AND 18

-- Faça uma consulta trazendo todos os dados do banco em um único select, exceto os dados de peças, partindo da tabela de serviço
SELECT * 
FROM SERVICO
LEFT JOIN FUNCIONARIO ON SERVICO.COD_FUNCIONARIO = FUNCIONARIO.COD_FUNCIONARIO
LEFT JOIN CELULAR ON SERVICO.COD_CELULAR = CELULAR.COD_CELULAR
LEFT JOIN MARCA ON CELULAR.cod_marca = MARCA.cod_marca
LEFT JOIN CLIENTE ON CELULAR.cod_cliente = CLIENTE.COD_CLIENTE
LEFT JOIN CIDADE ON CLIENTE.cod_cidade = CIDADE.cod_cidade
LEFT JOIN ESTADO ON ESTADO.cod_estado = CIDADE.cod_estado

-- Faça uma consulta trazendo os dados de serviços e peças em um único select
SELECT * FROM SERVICO
LEFT JOIN SERVICO_PECA ON SERVICO.cod_servico = SERVICO_PECA.cod_servico
LEFT JOIN PECA ON SERVICO_PECA.cod_peca = PECA.cod_peca

-- Crie um comando para atualizar em 10% os valores de serviços que contenham a letra A em sua descrição 
SELECT *, valor_servico * 1.1 
FROM SERVICO
WHERE DESCRICAO LIKE '%A%'
UPDATE SERVICO SET VALOR_SERVICO = valor_servico * 1.1 
WHERE DESCRICAO LIKE '%A%'
SELECT * FROM SERVICO

-- Crie um comando para excluir todos os registros de serviços realizados antes de 2010. 
SELECT * FROM SERVICO
WHERE DATA_SERVICO < '2010-01-01'
DELETE FROM SERVICO
WHERE DATA_SERVICO < '2010-01-01'

-- Faça uma consulta que traga os as peças vendidas e a diferença entre o preço atual e o preço vendido. A consulta deverá ter as colunas: Nome da peça, preço vendido, preço atual, % de variação do preço 
SELECT NOME_PECA, 
PRECO_ATUAL,
PRECO_VENDIDO,
preco_VENDIDO*100 / PRECO_ATUAL VARIACAO
FROM SERVICO
LEFT JOIN SERVICO_PECA ON SERVICO.COD_SERVICO = SERVICO_PECA.COD_SERVICO
LEFT JOIN PECA ON PECA.COD_PECA = SERVICO_PECA.COD_PECA 
WHERE NOME_PECA IS NOT NULL

-- Faça uma consulta que traga: todas as peças vendidas para os estados de SP e MG e para as marcas Samsung e Apple no mês de janeiro de 2014 exibindo ainda há quantos dias cada peça foi vendida 
SELECT nome_peca, DATEDIFF(DD,DATA_SERVICO,GETDATE()) 
FROM SERVICO
LEFT JOIN FUNCIONARIO ON SERVICO.cod_funcionario = FUNCIONARIO.cod_funcionario
LEFT JOIN CELULAR ON SERVICO.cod_celular = CELULAR.COD_CELULAR
LEFT JOIN MARCA ON CELULAR.cod_marca = MARCA.COD_MARCA
LEFT JOIN CLIENTE ON CLIENTE.COD_CLIENTE = CELULAR.cod_cliente
LEFT JOIN CIDADE ON CLIENTE.cod_cidade = CIDADE.COD_CIDADE
LEFT JOIN ESTADO ON CIDADE.cod_estado = ESTADO.COD_eSTADO
LEFT JOIN SERVICO_PECA ON SERVICO_PECA.cod_servico = SERVICO.COD_SERVICO
LEFT JOIN PECA ON SERVICO_PECA.cod_peca = PECA.COD_PECA
WHERE nome_estado IN ('São Paulo','Minas Gerais')
and nome_marca in ('Samsung','Apple')
and MONTH(data_servico) = 01 and YEAR(data_servico) = 2014

-- Faça uma consulta que traga: Serviços que ainda estão na garantia exibindo quantos dias ainda tem de garantia, cliente e marca
SELECT DESCRICAO, 
NOME_CLIENTE,
NOME_MARCA,
DATA_SERVICO,
GARANTIA,
DATA_SERVICO + GARANTIA, 
GETDATE()
FROM SERVICO
LEFT JOIN CELULAR ON SERVICO.COD_CELULAR = CELULAR.COD_CELULAR
LEFT JOIN MARCA ON CELULAR.COD_MARCA = MARCA.COD_MARCA
LEFT JOIN CLIENTE ON CELULAR.COD_CLIENTE = CLIENTE.COD_CLIENTE
WHERE DATA_SERVICO + GARANTIA >= GETDATE()

-- Crie uma VIEW com todos os dados do banco, exceto as tabelas serviço_peca e peças. 
CREATE VIEW [DBO].[VW_SERVICO]
AS
SELECT 
SERVICO.*,
FUNCIONARIO.NOME_FUNCIONARIO,
FUNCIONARIO.REGISTRO,
FUNCIONARIO.FUNCIONARIO_ATIVO,
CELULAR.MODELO,
CELULAR.COD_MARCA,
CELULAR.NUMERO_SERIE,
CELULAR.COD_CLIENTE,
CELULAR.CELULAR_ATIVO,
MARCA.NOME_MARCA,
MARCA.MARCA_ATIVO,
CLIENTE.NOME_CLIENTE,
CLIENTE.ENDERECO,
CLIENTE.FONE,
CLIENTE.CPF,
CLIENTE.CLIENTE_ATIVO,
CLIENTE.COD_CIDADE,
CIDADE.NOME_CIDADE,
CIDADE.ATIVO_CIDADE,
CIDADE.COD_ESTADO,
ESTADO.NOME_ESTADO,
ESTADO.ATIVO_ESTADO
FROM SERVICO
LEFT JOIN FUNCIONARIO ON SERVICO.COD_FUNCIONARIO = FUNCIONARIO.COD_FUNCIONARIO
LEFT JOIN CELULAR ON SERVICO.COD_CELULAR = CELULAR.COD_CELULAR
LEFT JOIN MARCA ON CELULAR.COD_MARCA = MARCA.COD_MARCA
LEFT JOIN CLIENTE ON CLIENTE.COD_CLIENTE = CELULAR.COD_CLIENTE
LEFT JOIN CIDADE ON CLIENTE.COD_CIDADE = CIDADE.COD_CIDADE
LEFT JOIN ESTADO ON CIDADE.COD_ESTADO = ESTADO.COD_ESTADO
SELECT * FROM VW_SERVICO

-- Faça SELECTs para trazer: quantidade de funcionários ativos 
SELECT COUNT(*) FROM FUNCIONARIO
WHERE funcionario_ativo = 1

-- Quantidade de celulares da marca samsung 
SELECT COUNT(*) FROM CELULAR
LEFT JOIN MARCA ON CELULAR.cod_marca = MARCA.cod_marca
WHERE nome_marca = 'SAMSUNG'

-- Quantidade de serviços realizados para a cidade de Jundiaí 
SELECT COUNT(*) FROM vw_servico
WHERE nome_cidade = 'JUNDIAI'

-- Soma do valor de todos os serviços em 2014 
SELECT SUM(valor_servico) FROM VW_SERVICO
WHERE YEAR(DATA_SERVICO) = 2014

-- Primeiro serviço realizado pelo funcionário 1 
SELECT MIN(DATA_SERVICO) FROM VW_SERVICO
WHERE cod_funcionario = 1

-- Ultimo serviço realizado para o cliente 2 
SELECT MAX(DATA_SERVICO) FROM vw_servico
WHERE cod_cliente = 2

-- Média de preço dos serviços de limpeza realizados em 2013 para clientes do estado de São Paulo 
SELECT COUNT(*) FROM VW_SERVICO
WHERE YEAR(DATA_SERVICO) = 2013
AND DESCRICAO = 'LIMPEZA'
AND NOME_ESTADO = 'São Paulo'

-- Faça SELECTs para trazer: quantidade de celulares de cada marca 
SELECT COUNT(*), NOME_MARCA FROM VW_SERVICO
GROUP BY NOME_MARCA

-- Quantidade de serviços realizados para cada cidade 
SELECT COUNT(*), NOME_CIDADE
FROM VW_SERVICO
GROUP BY NOME_CIDADE

-- Soma do valor de todos os serviços por mês e ano 
SELECT SUM(VALOR_SERVICO), MONTH(DATA_SERVICO) MES, YEAR(DATA_SERVICO) ANO
FROM VW_SERVICO
GROUP BY MONTH(DATA_SERVICO), YEAR(DATA_SERVICO) 

-- Primeiro serviço realizado por cada funcionário 
SELECT MIN(DATA_SERVICO), NOME_FUNCIONARIO
FROM VW_SERVICO
GROUP BY NOME_FUNCIONARIO

-- Último serviço realizado para cada cliente 
SELECT MAX(DATA_SERVICO), NOME_CLIENTE
FROM VW_SERVICO
GROUP BY NOME_CLIENTE

-- Média de preço dos serviços de limpeza realizados em 2013 por estado
SELECT AVG(valor_servico), NOME_ESTADO
FROM VW_SERVICO
WHERE descricao LIKE '%LIMPEZA%' AND YEAR(DATA_SERVICO) = 2013
GROUP BY NOME_ESTADO
