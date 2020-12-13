CREATE DEFINER=`admin`@`%` PROCEDURE `usp_combo_i_combo`(in pname varchar(45),in pdescription varchar(100),in ptype varchar(45),out oresult int)
BEGIN
	IF (SELECT EXISTS(SELECT * FROM Combo WHERE nombreCombo=pname))=false THEN
		INSERT INTO Combo (nombreCombo,descriptionCombo,typeCombo) 
		VALUES (pname,pdescription,ptype);
		SET oresult=1;
	END IF;
END