CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_categoria_d_categoria`(inout id int)
BEGIN
	IF (SELECT EXISTS(SELECT * FROM categories WHERE idCategories=id AND estateCategories=1)) THEN
		UPDATE categories 
		SET estateCategories=0 
		WHERE idCategories=id;
        IF (SELECT EXISTS(SELECT * FROM categories WHERE idCategories=id AND estateCategories=0)) THEN
			SELECT 'Se realizo la operacion';
            SELECT idCategories INTO id FROM categories WHERE idCategories=id AND estateCategories=0;
        ELSE
			SELECT 'No se realizo la operacion';
            SET id=-1;
        END IF;
	ELSE 
		SELECT 'No existe esta categoria';
        SET id=-2;
	END IF;
END