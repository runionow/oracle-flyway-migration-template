-- Use this folder to execute list of sql files, everytime whenever the docker container starts or stops
DECLARE
    v_count NUMBER;
BEGIN
    -- Check if the user HR_SERVICE exists in the database
    SELECT COUNT(*) INTO v_count FROM all_users WHERE username = 'HR_SERVICE';
    -- If the user does not exist, then create it and grant the necessary privileges
    IF v_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE USER HR_SERVICE IDENTIFIED BY password DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS';
        EXECUTE IMMEDIATE 'GRANT CONNECT, DB_DEVELOPER_ROLE, AQ_ADMINISTRATOR_ROLE, AQ_USER_ROLE TO HR_SERVICE';
        EXECUTE IMMEDIATE 'GRANT ALTER ANY TABLE TO HR_SERVICE';
        EXECUTE IMMEDIATE 'GRANT DROP ANY TABLE TO HR_SERVICE';
        EXECUTE IMMEDIATE 'GRANT DELETE ANY TABLE TO HR_SERVICE';
    END IF;
END;
/