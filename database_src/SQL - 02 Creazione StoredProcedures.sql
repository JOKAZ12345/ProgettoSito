USE `pariopp`;

START TRANSACTION;
DROP FUNCTION IF EXISTS pariopp.CHECK_LOGIN;
DROP FUNCTION IF EXISTS pariopp.USER_EXISTS;

DELIMITER $$

CREATE FUNCTION pariopp.USER_EXISTS(P_USERNAME  VARCHAR(50),P_EMAIL VARCHAR(50) )
	RETURNS TINYINT(1)
BEGIN
	IF EXISTS(SELECT * FROM utenti where USERNAME=P_USERNAME or EMAIL=P_EMAIL)
	then
		RETURN 1;
	ELSE 
		RETURN 0;
	END IF;
END;
$$

CREATE FUNCTION pariopp.CHECK_LOGIN(P_USERNAME VARCHAR(50), P_PASSWORD CHAR(40) )
	RETURNS TINYINT(1)
BEGIN
	IF EXISTS(SELECT * FROM utenti where USERNAME=P_USERNAME AND PASSWORD=P_PASSWORD)
	then
		RETURN 1;
	ELSE 
		RETURN 0;
	END IF;
END;
$$

DELIMITER ;
COMMIT;


/*
INSERT INTO `pariopp`.`utenti`
(`USERNAME`,`PASSWORD`,`NOME`,`COGNOME`,`EMAIL`)
VALUES ("buc", "aeiou", "Antonio","Bucciol","a@b.c");

TEST:
select CHECK_LOGIN('buc', 'aeiou');
select CHECK_LOGIN('buc', 'aeio');

*/