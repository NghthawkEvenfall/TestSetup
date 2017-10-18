CREATE DEFINER=`root`@`localhost` PROCEDURE `WEB_SERVICE_MOBILE_SIGNUP_PUT`(
	USER_ID_VALUE 		VARCHAR(20),
    CFA_ID_VALUE		VARCHAR(20),
    TOKEN_TYPE_VALUE	VARCHAR(3)
)
BEGIN
	
    DECLARE SIGNUP_STATUS VARCHAR(15);
    
	IF TOKEN_TYPE_VALUE = 1 THEN
    
		IF EXISTS(
			SELECT 1 FROM GAME.USER WHERE IFNULL(US_SHOPPERID,0) = CFA_ID_VALUE
		) THEN
			SET SIGNUP_STATUS = 'ACCOUNT_PREVIOUSLY_LINKED';
		ELSE
			SET SIGNUP_STATUS = 'ACCOUNT_LINKED';
            
            UPDATE GAME.USER SET US_SHOPPERID = CFA_ID_VALUE WHERE USER_ID = USER_ID_VALUE AND IFNULL(US_SHOPPERID,0) = 0;
		END IF;
        
	ELSEIF TOKEN_TYPE_VALUE = 2 THEN
    
		IF EXISTS(
			SELECT 1 FROM GAME.USER WHERE IFNULL(UK_SHOPPERID,0) = CFA_ID_VALUE
		) THEN
			SET SIGNUP_STATUS = 'ACCOUNT_PREVIOUSLY_LINKED';
		ELSE
			SET SIGNUP_STATUS = 'ACCOUNT_LINKED';
            
            UPDATE GAME.USER SET UK_SHOPPERID = CFA_ID_VALUE WHERE USER_ID = USER_ID_VALUE AND IFNULL(UK_SHOPPERID,0) = 0;
		END IF;
        
    ELSEIF TOKEN_TYPE_VALUE = 3 THEN

		IF EXISTS(
			SELECT 1 FROM GAME.USER WHERE IFNULL(US_CFA_ID,0) = CFA_ID_VALUE
		) THEN
			SET SIGNUP_STATUS = 'ACCOUNT_PREVIOUSLY_LINKED';
		ELSE
			SET SIGNUP_STATUS = 'ACCOUNT_LINKED';
            
            UPDATE GAME.USER SET US_CFA_ID = CFA_ID_VALUE WHERE USER_ID = USER_ID_VALUE AND IFNULL(US_CFA_ID,0) = 0;
		END IF;
    END IF;
    
	SELECT SIGNUP_STATUS;
END
