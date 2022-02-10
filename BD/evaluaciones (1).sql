/*
 Navicat Premium Data Transfer

 Source Server         : dropletMssql
 Source Server Type    : SQL Server
 Source Server Version : 15004102
 Source Host           : 143.198.229.70:1433
 Source Catalog        : evaluacion
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15004102
 File Encoding         : 65001

 Date: 09/02/2022 23:46:52
*/


-- ----------------------------
-- Table structure for alumno_materia
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[alumno_materia]') AND type IN ('U'))
	DROP TABLE [dbo].[alumno_materia]
GO

CREATE TABLE [dbo].[alumno_materia] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [alumno_id] int  NOT NULL,
  [materia_id] int  NOT NULL,
  [calificacion] float(53)  NOT NULL
)
GO

ALTER TABLE [dbo].[alumno_materia] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of alumno_materia
-- ----------------------------
SET IDENTITY_INSERT [dbo].[alumno_materia] ON
GO

SET IDENTITY_INSERT [dbo].[alumno_materia] OFF
GO


-- ----------------------------
-- Table structure for alumnos
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[alumnos]') AND type IN ('U'))
	DROP TABLE [dbo].[alumnos]
GO

CREATE TABLE [dbo].[alumnos] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(100) COLLATE Modern_Spanish_100_CI_AI_SC_UTF8  NOT NULL,
  [apellido] varchar(100) COLLATE Modern_Spanish_100_CI_AI_SC_UTF8  NULL,
  [cedula] varchar(10) COLLATE Modern_Spanish_100_CI_AI_SC_UTF8  NOT NULL,
  [aula_id] int  NULL
)
GO

ALTER TABLE [dbo].[alumnos] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of alumnos
-- ----------------------------
SET IDENTITY_INSERT [dbo].[alumnos] ON
GO

INSERT INTO [dbo].[alumnos] ([id], [nombre], [apellido], [cedula], [aula_id]) VALUES (N'1', N'Camila', N'González', N'201874856', N'1')
GO

INSERT INTO [dbo].[alumnos] ([id], [nombre], [apellido], [cedula], [aula_id]) VALUES (N'2', N'Emilio', N'Díaz', N'201898245', N'2')
GO

INSERT INTO [dbo].[alumnos] ([id], [nombre], [apellido], [cedula], [aula_id]) VALUES (N'3', N'Daniel', N'Rodríguez', N'201896384', N'1')
GO

INSERT INTO [dbo].[alumnos] ([id], [nombre], [apellido], [cedula], [aula_id]) VALUES (N'4', N'Fernanda', N'Martínez', N'201719745', N'1')
GO

INSERT INTO [dbo].[alumnos] ([id], [nombre], [apellido], [cedula], [aula_id]) VALUES (N'5', N'Javier', N'Gómez', N'201896873', N'3')
GO

INSERT INTO [dbo].[alumnos] ([id], [nombre], [apellido], [cedula], [aula_id]) VALUES (N'6', N'María', N'Romero', N'201836289', N'3')
GO

INSERT INTO [dbo].[alumnos] ([id], [nombre], [apellido], [cedula], [aula_id]) VALUES (N'7', N'Ximena', N'Sosa', N'201874891', N'2')
GO

SET IDENTITY_INSERT [dbo].[alumnos] OFF
GO


-- ----------------------------
-- Table structure for aulas
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[aulas]') AND type IN ('U'))
	DROP TABLE [dbo].[aulas]
GO

CREATE TABLE [dbo].[aulas] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [numero] int  NOT NULL,
  [edificio] varchar(2) COLLATE Modern_Spanish_100_CI_AI_SC_UTF8  NOT NULL
)
GO

ALTER TABLE [dbo].[aulas] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of aulas
-- ----------------------------
SET IDENTITY_INSERT [dbo].[aulas] ON
GO

INSERT INTO [dbo].[aulas] ([id], [numero], [edificio]) VALUES (N'1', N'201', N'A')
GO

INSERT INTO [dbo].[aulas] ([id], [numero], [edificio]) VALUES (N'2', N'302', N'A')
GO

INSERT INTO [dbo].[aulas] ([id], [numero], [edificio]) VALUES (N'3', N'405', N'F')
GO

SET IDENTITY_INSERT [dbo].[aulas] OFF
GO


-- ----------------------------
-- Table structure for materias
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[materias]') AND type IN ('U'))
	DROP TABLE [dbo].[materias]
GO

CREATE TABLE [dbo].[materias] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(100) COLLATE Modern_Spanish_100_CI_AI_SC_UTF8  NULL,
  [creditos] int  NULL
)
GO

ALTER TABLE [dbo].[materias] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of materias
-- ----------------------------
SET IDENTITY_INSERT [dbo].[materias] ON
GO

SET IDENTITY_INSERT [dbo].[materias] OFF
GO


-- ----------------------------
-- Table structure for profesores
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[profesores]') AND type IN ('U'))
	DROP TABLE [dbo].[profesores]
GO

CREATE TABLE [dbo].[profesores] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(100) COLLATE Modern_Spanish_100_CI_AI_SC_UTF8  NULL,
  [apellido] varchar(100) COLLATE Modern_Spanish_100_CI_AI_SC_UTF8  NULL,
  [identificacion] varchar(10) COLLATE Modern_Spanish_100_CI_AI_SC_UTF8  NULL,
  [aula_id] int  NULL
)
GO

ALTER TABLE [dbo].[profesores] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of profesores
-- ----------------------------
SET IDENTITY_INSERT [dbo].[profesores] ON
GO

INSERT INTO [dbo].[profesores] ([id], [nombre], [apellido], [identificacion], [aula_id]) VALUES (N'1', N'Adriana', N'Vera', N'MWM987513', N'3')
GO

INSERT INTO [dbo].[profesores] ([id], [nombre], [apellido], [identificacion], [aula_id]) VALUES (N'2', N'Gabriel', N'Miranda', N'YTJ321545', N'1')
GO

INSERT INTO [dbo].[profesores] ([id], [nombre], [apellido], [identificacion], [aula_id]) VALUES (N'3', N'Luisa', N'Sandoval', N'WM332154', N'2')
GO

SET IDENTITY_INSERT [dbo].[profesores] OFF
GO


-- ----------------------------
-- Table structure for promedio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[promedio]') AND type IN ('U'))
	DROP TABLE [dbo].[promedio]
GO

CREATE TABLE [dbo].[promedio] (
  [alumno_id] int  NOT NULL,
  [promedio] float(53)  NULL
)
GO

ALTER TABLE [dbo].[promedio] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of promedio
-- ----------------------------
INSERT INTO [dbo].[promedio] ([alumno_id], [promedio]) VALUES (N'1', N'8.2')
GO

INSERT INTO [dbo].[promedio] ([alumno_id], [promedio]) VALUES (N'2', N'7.8')
GO

INSERT INTO [dbo].[promedio] ([alumno_id], [promedio]) VALUES (N'3', N'9.3')
GO

INSERT INTO [dbo].[promedio] ([alumno_id], [promedio]) VALUES (N'4', N'6.4')
GO

INSERT INTO [dbo].[promedio] ([alumno_id], [promedio]) VALUES (N'5', N'9.7')
GO

INSERT INTO [dbo].[promedio] ([alumno_id], [promedio]) VALUES (N'6', N'8.6')
GO

INSERT INTO [dbo].[promedio] ([alumno_id], [promedio]) VALUES (N'7', N'8.1')
GO


-- ----------------------------
-- Auto increment value for alumno_materia
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[alumno_materia]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table alumno_materia
-- ----------------------------
ALTER TABLE [dbo].[alumno_materia] ADD CONSTRAINT [PK__alumno_m__3213E83FD8591A63] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for alumnos
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[alumnos]', RESEED, 7)
GO


-- ----------------------------
-- Primary Key structure for table alumnos
-- ----------------------------
ALTER TABLE [dbo].[alumnos] ADD CONSTRAINT [PK__alumnos__3213E83FE9CB0C62] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for aulas
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[aulas]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table aulas
-- ----------------------------
ALTER TABLE [dbo].[aulas] ADD CONSTRAINT [PK__aulas__3213E83F18AC1C26] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for materias
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[materias]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table materias
-- ----------------------------
ALTER TABLE [dbo].[materias] ADD CONSTRAINT [PK__materias__3213E83FAFDD40E1] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for profesores
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[profesores]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table profesores
-- ----------------------------
ALTER TABLE [dbo].[profesores] ADD CONSTRAINT [PK__profesor__3213E83F06F4E4D7] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table promedio
-- ----------------------------
ALTER TABLE [dbo].[promedio] ADD CONSTRAINT [PK__promedio__3213E83FFEE6D78C] PRIMARY KEY CLUSTERED ([alumno_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table alumno_materia
-- ----------------------------
ALTER TABLE [dbo].[alumno_materia] ADD CONSTRAINT [alumnoM_fk] FOREIGN KEY ([alumno_id]) REFERENCES [dbo].[alumnos] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[alumno_materia] ADD CONSTRAINT [materia_fk] FOREIGN KEY ([materia_id]) REFERENCES [dbo].[materias] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO


-- ----------------------------
-- Foreign Keys structure for table promedio
-- ----------------------------
ALTER TABLE [dbo].[promedio] ADD CONSTRAINT [alumno_fk] FOREIGN KEY ([alumno_id]) REFERENCES [dbo].[alumnos] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

