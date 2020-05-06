
ALTER PROC usp_UpdateStudent
@Id INT, @Name VARCHAR(50), @Email VARCHAR(100)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			IF(NOT EXISTS(SELECT * FROM tblStudents WHERE Id=@Id))
			BEGIN
				RAISERROR('Student with given Id not found',16,1)
			END
			UPDATE tblStudents SET Name = @Name WHERE Id=@Id
			IF(EXISTS(SELECT Email FROM tblStudents WHERE Id<>@Id AND Email=@Email))
			BEGIN
				RAISERROR('Already exist the provided email, try with another email address',16,1)
			END
			UPDATE tblStudents SET Email=@Email WHERE Id=@Id
			COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SELECT
		ERROR_NUMBER() AS ErrNumber,
		ERROR_MESSAGE() AS ErrMessage,
		ERROR_PROCEDURE() AS ErrProcedure,
		ERROR_STATE() AS ErrState,
		ERROR_LINE() AS ErrLine
	END CATCH
END

EXEC usp_UpdateStudent 1, 'Ashiqs','mralex@gmail.com'
SELECT * FROM tblStudents
