CREATE TRIGGER [dbo].[promedio_alumno]
ON [dbo].[alumno_materia]
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @AlumnoId INT
		DECLARE @Activity  NVARCHAR (50)
		
		IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
		BEGIN
				SET @Activity = 'UPDATE'
		END

		IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted)
		BEGIN
				SET @Activity = 'INSERT'
		END

		IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS(SELECT * FROM inserted)
		BEGIN
				SET @Activity = 'DELETE'
		END
		
		IF @Activity = 'UPDATE' OR @Activity = 'INSERT' 
		BEGIN
			SELECT @AlumnoId = inserted.alumno_id FROM inserted
		END
		IF @Activity = 'DELETE'
		BEGIN
			SELECT @AlumnoId = deleted.alumno_id FROM deleted
		END
		
		UPDATE promedio 
		SET promedio = (SELECT ISNULL(AVG(calificacion),0) FROM alumno_materia WHERE alumno_id = @AlumnoId)
		WHERE alumno_id = @AlumnoId
END
GO

EXEC sp_addextendedproperty
'MS_Description', N'Actualiza el promedio del alumno',
'SCHEMA', N'dbo',
'TABLE', N'Untitled',
'TRIGGER', N'promedio_alumno'