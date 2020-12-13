CREATE DEFINER=`admin`@`%` PROCEDURE `usp_product_i_product`(in pname varchar(45),in pdescription varchar(200),in pprice varchar(150),in  pcategoryid int,out oresult int)
BEGIN
	IF (SELECT EXISTS(SELECT * FROM Products WHERE nameProducts=pname))=false THEN
		INSERT INTO Products (nameProducts,descriptionProducts,priceProducts,Categories_idCategories,estateProducts) 
		VALUES (pname,pdescription,pprice,pcategoryid,1);
		SET oresult=1;
	END IF;
END