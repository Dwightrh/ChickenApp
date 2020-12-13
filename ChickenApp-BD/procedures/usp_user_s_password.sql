CREATE DEFINER=`admin`@`%` PROCEDURE `usp_user_s_password`(in pemail varchar(45),out oresult varchar(255))
BEGIN
     SET oresult=(SELECT passwordUsers FROM Users WHERE emailusers=pemail);  
END