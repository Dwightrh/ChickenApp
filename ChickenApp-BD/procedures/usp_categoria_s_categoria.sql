CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_categoria_s_categoria`(IN id INT,IN estado INT)
BEGIN
	IF (id=0) THEN
		SELECT * FROM categories WHERE estateCategories=estado;
	else
		IF (SELECT EXISTS(SELECT * FROM categories WHERE idCategories=id 
		AND estateCategories=estado)) THEN
			SELECT * FROM categories WHERE idCategories=id AND estateCategories=estado;
		ELSE	
			SELECT 'No existe esta categoria';
		END IF;
    END IF;
END