CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_categoria_i_categoria`(out id int,in nombre varchar(45) ,in descripcion varchar(200))
BEGIN
	IF (SELECT EXISTS(SELECT * FROM categories WHERE nameCategories=nombre))=false THEN
		INSERT INTO categories (nameCategories,descriptionCategories,estateCategories) 
		VALUES (nombre,descripcion,1);
		IF (SELECT EXISTS(SELECT * FROM categories WHERE nameCategories=nombre 
		AND descriptionCategories=descripcion AND estateCategories=1)) THEN
			SELECT 'Se realizo la operacion';
            SELECT idCategories INTO id FROM categories WHERE nameCategories=nombre 
			AND descriptionCategories=descripcion AND estateCategories=1;
        ELSE
			SELECT 'No se realizo la operacion';
            SET id=-1;
        END IF;
	ELSE	
		SELECT 'Ya existe esta categoria';
        SELECT idCategories INTO id FROM categories WHERE nameCategories=nombre;
	END IF;
END