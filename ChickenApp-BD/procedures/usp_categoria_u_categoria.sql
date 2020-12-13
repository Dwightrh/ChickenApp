CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_categoria_u_categoria`(inout id int,in nombre varchar(45),in descripcion varchar(200))
BEGIN
	IF (SELECT EXISTS(SELECT * FROM categories WHERE idCategories=id AND estateCategories=1)) THEN
		UPDATE categories 
		SET nameCategories=nombre,descriptionCategories=descripcion 
		WHERE idCategories=id;
        IF (SELECT EXISTS(select * FROM categories 
			WHERE idCategories=id AND nameCategories=nombre 
			AND descriptionCategories=descripcion))THEN
			SELECT 'Se realizo la operacion';
            SELECT idCategories INTO id FROM categories 
			WHERE idCategories=id and nameCategories=nombre and descriptionCategories=descripcion;
        ELSE
			SELECT 'No se realizo la operacion';
            SET id=-1;
        END IF;
	ELSE
		SELECT 'No existe esta categoria';
        SET id=-2;
	END IF;
END