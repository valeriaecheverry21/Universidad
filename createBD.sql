CREATE DATABASE [UniversidadDb];
GO

USE [UniversidadDb]
GO

/******  Schema [tienda]   ******/
CREATE SCHEMA [Universidad]
GO

/******  Table [tienda].[DetalleOrden]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Universidad].[DetalleCurso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CursoId] [int] NOT NULL,
	[PrfesorId] [int] NOT NULL,
	[AlumnoId] [decimal](18, 2) NOT NULL,
	[FechaRegistro] [datetime2](7) NOT NULL,	
	[turno] [nvarchar](256) NULL,
	
 CONSTRAINT [PK_DetalleCurso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/******  Table [universidad].[Curso]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Universidad].[Curso](
    [Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/******  Table [tienda].[Perfil]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Universidad].[Perfil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/******  Table [Universidad].[Alumno]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Universidad].[Alumno](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](256) NULL,
	[Apellido] [nvarchar](256) NULL,
	[sexo] [nvarchar](256) NULL,
	[Carrera] [nvarchar](256) NULL,
	[DNI] [decimal](18, 2) NOT NULL,	
	[FechaRegistro] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO/******  Table [tienda].[Profesor]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Universidad].[Profesor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](256) NULL,
	[Apellido] [nvarchar](256) NULL,
	[sexo] [nvarchar](256) NULL,	
	[DNI] [decimal](18, 2) NOT NULL,	
	[FechaNacimiento] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Profesor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/******  Table [tienda].[Usuario]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Universidad].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](256) NULL,
	[Email] [nvarchar](100) NULL,
	[Username] [nvarchar](25) NULL,
	[Password] [nvarchar](512) NULL,
	[Estatus] [int] NOT NULL,
	[PerfilId] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
SET IDENTITY_INSERT [Universidad].[Perfil] ON 

INSERT [Universidad].[Perfil] ([Id], [Nombre]) VALUES (1, N'Administrador')
INSERT [Universidad].[Perfil] ([Id], [Nombre]) VALUES (2, N'UserAlumno')
INSERT [Universidad].[Perfil] ([Id], [Nombre]) VALUES (3, N'userProfesor')
SET IDENTITY_INSERT [Universidad].[Perfil] OFF

SET IDENTITY_INSERT [Universidad].[Alumno] ON 
INSERT [Universidad].[Alumno] ([Id], [Nombre], [Apellido], [sexo], [carrera],[DNI],[FechaRegistro]) VALUES (1, N'Jose', N'hernandez', N'Masculino',  N'Ingenieria de sistemas',CAST(278943554645656 AS Decimal(18, 2)), CAST(0x070000000000233F0B AS DateTime2))
SET IDENTITY_INSERT [Universidad].[Alumno] OFF


SET IDENTITY_INSERT [Universidad].[Profesor] ON 
INSERT [Universidad].[Profesor] ([Id], [Nombre], [Apellido], [sexo],[DNI],[FechaNacimiento]) VALUES (1, N'federico', N'Davila', N'Masculino',CAST(278943554645656 AS Decimal(18, 2)), CAST(0x070000000000233F0B AS DateTime2))
SET IDENTITY_INSERT [Universidad].[Profesor] OFF

SET IDENTITY_INSERT [Universidad].[Usuario] ON 
INSERT [Universidad].[Usuario] ([Id], [Nombre], [Apellidos], [Email], [Username], [Password], [Estatus], [PerfilId]) VALUES (1, N'Admin', N'Admin', N'admin@correo.com', N'UserAlumno', N'123456', 1, 1)
INSERT [Universidad].[Usuario] ([Id], [Nombre], [Apellidos], [Email], [Username], [Password], [Estatus], [PerfilId]) VALUES (2, N'UserAlumno', N'UserAlumno', N'vendedor@correo.com', N'UserAlumno', N'123456', 1, 2)
INSERT [Universidad].[Usuario] ([Id], [Nombre], [Apellidos], [Email], [Username], [Password], [Estatus], [PerfilId]) VALUES (3, N'UserAlumno', N'UserAlumno', N'cliente@correo.com', N'Administrador', N'123456', 1, 2)
SET IDENTITY_INSERT [Universidad].[Usuario] OFF

SET IDENTITY_INSERT [Universidad].[Curso] ON 

INSERT [Universidad].[Curso] ([Id], [Nombre]) VALUES (1,N'Estadistica' )
INSERT [Universidad].[Curso] ([Id], [Nombre]) VALUES (2, N'Base de datos')
INSERT [Universidad].[Curso] ([Id], [Nombre]) VALUES (3,N'Sistemas Operativos' )
SET IDENTITY_INSERT [Universidad].[Orden] OFF

SET IDENTITY_INSERT [Universidad].[DetalleCurso] ON 
INSERT [Universidad].[DetalleCurso] ([Id], [CursoId], [ProfesorId], [AlumnoId], [FechaRegistro], [turno]) VALUES (1, 1, 1, CAST(0x070000000000233F0B AS DateTime2), N'Noche' )
SET IDENTITY_INSERT [Universidad].[DetalleCurso] OFF

