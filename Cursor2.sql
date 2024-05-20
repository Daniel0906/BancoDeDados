DECLARE
v_id INTEGER := &ID; --entrada
v_emp INTEGER;
v_nome VARCHAR(100);
v_vale NUMBER(10,2); --guarda o vale de 5%
v_salario employees.salary%TYPE;
CURSOR exemplo3 IS
SELECT employee_id, first_name||' '||last_name, salary
FROM employees
WHERE manager_id = v_id;
BEGIN
OPEN exemplo3;
LOOP
FETCH exemplo3 INTO v_emp, v_nome, v_salario;
EXIT WHEN exemplo3%NOTFOUND;
--oque o enunciado pede?
v_vale := v_salario * 0.05;
--inserir os dados na tabela func
INSERT INTO func (id, nome, vale_compra)
VALUES (v_emp, v_nome, v_vale);
END LOOP;
COMMIT;
CLOSE exemplo3;
END;
/
