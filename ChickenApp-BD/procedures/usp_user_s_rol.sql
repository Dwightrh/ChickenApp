CREATE DEFINER=`admin`@`%` PROCEDURE `usp_user_s_rol`(in pemail varchar(45))
BEGIN

      SET @tipo = (SELECT typeUser FROM Users WHERE emailusers=pemail);
      
      --  ////// TIPO CLIENTE ////////////////////////////////////////
      IF ( @tipo = '1' ) THEN
        SELECT typeUser,idCustomers AS "idClient" , firstnameCustomers AS "firstname" ,
        lastnameCustomers AS "lastname" , phoneCustomers AS "phone" , adressCustomers AS "adress",
        emailCustomers AS "email",passwordUsers AS "password" 
        FROM Customers INNER JOIN Users ON Customers.emailCustomers = Users.emailUsers 
        WHERE emailUsers=pemail;
      END IF;
      
      --  ////// TIPO ADMIN ///////////////AUN NO DEFINIDO///////////////
      IF ( @tipo = '2' ) THEN
        SELECT typeUser FROM Users WHERE emailusers=pemail;
	  END IF;     
      
       --  ////// TIPO COCINERO ////////////////////////////////////////
       IF ( @tipo = '3' ) THEN
      
        SELECT typeUser,idEmployees AS "idChef" , firstnameEmployees AS "firstname" ,
        lastnameEmployees AS "lastname" , dniEmployees AS "dni" , phoneEmployees AS "phone" ,
        workshiftEmployees AS "workshift", ageEmployees AS "age", emailEmployees AS "email",passwordUsers AS "password",adressEmployees AS "adress" 
        FROM Employees INNER JOIN Users ON Employees.emailEmployees = Users.emailUsers 
        WHERE emailUsers=pemail;
	  END IF;
      
      --  ////// TIPO DELIVERY ////////////////////////////////////////
      IF ( @tipo = '4' ) THEN
      
        SELECT typeUser ,idEmployees AS "idDeliveryboy" , firstnameEmployees AS "firstname" ,
        lastnameEmployees AS "lastname" , dniEmployees AS "dni" , phoneEmployees AS "phone" ,
        workshiftEmployees AS "workshift", ageEmployees AS "age", emailEmployees AS "email",passwordUsers AS "password", adressEmployees AS "adress" 
        FROM Employees INNER JOIN Users ON Employees.emailEmployees = Users.emailUsers 
        WHERE emailUsers=pemail;
         
	  END IF;
     
     
END