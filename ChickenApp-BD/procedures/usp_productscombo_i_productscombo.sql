CREATE DEFINER=`admin`@`%` PROCEDURE `usp_productcombo_i_productcombo`(in pproductid int,in pcombotid int,out oresult int)
BEGIN
	IF (SELECT EXISTS(SELECT * FROM Products_Combo WHERE Products_idProducts=pproductid))=false THEN
		INSERT INTO Products_Combo (Products_idProducts,Combo_idCombos) 
		VALUES (pproductid,pcombotid);
		SET oresult=1;
	END IF;
END