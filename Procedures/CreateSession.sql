Create Procedure CreateSession @UserID int, @Active int AS 
INSERT INTO 
Session (UserID, Active)
VALUES (@UserID, @Active)
