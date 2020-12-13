CREATE DEFINER=`admin`@`%` PROCEDURE `usp_combo_u_combo`(in pcomboid int,in pname varchar(45),in pdescription varchar(100),in ptype varchar(45),out oresult int)
BEGIN
	IF (SELECT EXISTS(SELECT * FROM Combo WHERE idCombos=pcomboid)) THEN
		UPDATE Combo 
		SET nombreCombo=pname,descriptionCombo=pdescription,typeCombo=ptype
		WHERE idCombos=pcomboid;
        SET oresult=1;
	END IF;
END