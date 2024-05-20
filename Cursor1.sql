DECLARE
v_depto INTEGER := &depto; --variavel de entrada
--variaveis de saida
v_first employees.first_name%TYPE;
v_titulo jobs.job_title%TYPE;
--declarar o cursos (SELECT SEM INTO COM UM NOME)
CURSOR exemplo1 IS
SELECT e.first_name, j.job_title FROM employees e, jobs j
WHERE e.department_id = v_depto
AND e.job_id = j.job_id;
BEGIN
--abrir o cursos declarado
OPEN exemplo1;
--iniciar o loop
LOOP
--extrair os dados do cursor aberto e colocar nas variaveis de saida
--declaradas na ORDEM do SELECT
FETCH exemplo1 INTO v_first, v_titulo;
--condicao de saida
--quando nao houver mais dados que atendam a condicao
EXIT WHEN exemplo1%NOTFOUND;
--o que desejamos fzer com os dodados do cursos? enunciado, objetivo
DBMS_OUTPUT.PUT_LINE(v_first||' trabalha como '|| v_titulo);
--fechar loop
END LOOP;
--fechar o cursor aberto
CLOSE exemplo1;
END;
/
