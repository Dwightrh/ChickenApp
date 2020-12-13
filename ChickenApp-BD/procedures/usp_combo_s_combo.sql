CREATE DEFINER=`admin`@`%` PROCEDURE `usp_combo_s_combo`()
BEGIN
	IF (SELECT EXISTS(SELECT * FROM Combo)) THEN
		SELECT idCombos AS "idCombo" , nombreCombo AS "name" , descriptionCombo AS "description" ,
		typeCombo AS "type" 
		FROM Combo ;
    END IF;
END