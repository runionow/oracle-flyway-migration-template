-- Flyway Undo Migration Script: U1__drop_employee_table.sql
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE employee';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE = -942 THEN
      NULL; -- Table does not exist; ignore error ORA-00942
    ELSE
      RAISE;
    END IF;
END;
/