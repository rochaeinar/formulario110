create database FORMULARIO_110
go


USE [FORMULARIO_110]
GO
/****** Object:  Table [dbo].[CONTRIBUYENTE]    Script Date: 8/31/2019 5:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRIBUYENTE](
	[DOCUMENTO_IDENTIDAD] [int] NOT NULL,
	[ID_LUGAR] [int] NULL,
	[NOMBRES] [char](256) NOT NULL,
	[APELLIDO_PATERNO] [char](256) NOT NULL,
	[APELLIDO_MATERNO] [char](256) NOT NULL,
	[APELLIDO_CASADA] [char](256) NULL,
	[DOMICILIO] [char](256) NOT NULL,
	[NUMERO_NIT_EMPLEADOR] [int] NOT NULL,
	[TIPO_DOCUMENTO] [int] NULL,
 CONSTRAINT [PK_DEPENDIENTE] PRIMARY KEY NONCLUSTERED 
(
	[DOCUMENTO_IDENTIDAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADOR]    Script Date: 8/31/2019 5:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADOR](
	[NUMERO_NIT] [int] NOT NULL,
	[RAZON_SOCIAL] [char](256) NULL,
	[DOMICILIO] [char](256) NULL,
 CONSTRAINT [PK_EMPLEADOR] PRIMARY KEY NONCLUSTERED 
(
	[NUMERO_NIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTURA]    Script Date: 8/31/2019 5:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURA](
	[NUMERO_FACTURA] [int] NOT NULL,
	[NIT] [int] NOT NULL,
	[NUMERO_AUTORIZACION] [int] NOT NULL,
	[FECHA] [datetime] NOT NULL,
	[IMPORTE] [float] NOT NULL,
	[CODIGO_CONTROL] [char](256) NULL,
	[FACTURA_ELECTRONICA] [char](256) NULL,
	[NUMERO_ORDEN_FORMULARIO] [int] NULL,
	[FECHA_LIMITE] [datetime] NULL,
	[MONTO_LITERAL] [nchar](100) NULL,
 CONSTRAINT [PK_FACTURA] PRIMARY KEY NONCLUSTERED 
(
	[NUMERO_FACTURA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FORMULARIO_110]    Script Date: 8/31/2019 5:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORMULARIO_110](
	[NUMERO_ORDEN] [int] NOT NULL,
	[DOCUMENTO_IDENTIDAD] [int] NULL,
	[MES] [int] NULL,
	[ANO] [int] NULL,
	[TOTAL_DETALLE] [float] NULL,
	[DETERMINACION_PAGO] [float] NULL,
	[FECHA_PRESENTACION] [datetime] NULL,
	[LUGAR_PRESENTACION] [int] NULL,
 CONSTRAINT [PK_FORMULARIO_110] PRIMARY KEY NONCLUSTERED 
(
	[NUMERO_ORDEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LUGAR_EXPEDICION]    Script Date: 8/31/2019 5:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUGAR_EXPEDICION](
	[ID_LUGAR] [int] NOT NULL,
	[LUGAR] [char](256) NULL,
 CONSTRAINT [PK_LUGAR] PRIMARY KEY NONCLUSTERED 
(
	[ID_LUGAR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_DOCUMENTO]    Script Date: 8/31/2019 5:31:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_DOCUMENTO](
	[ID_TIPO_DOCUMENTO] [int] NOT NULL,
	[TIPO_DOCUMENTO] [nchar](30) NOT NULL,
 CONSTRAINT [PK_TIPO_DOCUMENTO] PRIMARY KEY CLUSTERED 
(
	[ID_TIPO_DOCUMENTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CONTRIBUYENTE]  WITH CHECK ADD  CONSTRAINT [FK_DEPENDIE_RELATIONS_EMPLEADOR] FOREIGN KEY([NUMERO_NIT_EMPLEADOR])
REFERENCES [dbo].[EMPLEADOR] ([NUMERO_NIT])
GO
ALTER TABLE [dbo].[CONTRIBUYENTE] CHECK CONSTRAINT [FK_DEPENDIE_RELATIONS_EMPLEADOR]
GO
ALTER TABLE [dbo].[CONTRIBUYENTE]  WITH CHECK ADD  CONSTRAINT [FK_DEPENDIE_RELATIONS_LUGAR] FOREIGN KEY([ID_LUGAR])
REFERENCES [dbo].[LUGAR_EXPEDICION] ([ID_LUGAR])
GO
ALTER TABLE [dbo].[CONTRIBUYENTE] CHECK CONSTRAINT [FK_DEPENDIE_RELATIONS_LUGAR]
GO
ALTER TABLE [dbo].[CONTRIBUYENTE]  WITH CHECK ADD  CONSTRAINT [FK_DEPENDIENTE_TIPO_DOCUMENTO] FOREIGN KEY([TIPO_DOCUMENTO])
REFERENCES [dbo].[TIPO_DOCUMENTO] ([ID_TIPO_DOCUMENTO])
GO
ALTER TABLE [dbo].[CONTRIBUYENTE] CHECK CONSTRAINT [FK_DEPENDIENTE_TIPO_DOCUMENTO]
GO
ALTER TABLE [dbo].[FACTURA]  WITH CHECK ADD  CONSTRAINT [FK_FACTURA_RELATIONS_FORMULAR] FOREIGN KEY([NUMERO_ORDEN_FORMULARIO])
REFERENCES [dbo].[FORMULARIO_110] ([NUMERO_ORDEN])
GO
ALTER TABLE [dbo].[FACTURA] CHECK CONSTRAINT [FK_FACTURA_RELATIONS_FORMULAR]
GO
ALTER TABLE [dbo].[FORMULARIO_110]  WITH CHECK ADD  CONSTRAINT [FK_FORMULAR_RELATIONS_DEPENDIE] FOREIGN KEY([DOCUMENTO_IDENTIDAD])
REFERENCES [dbo].[CONTRIBUYENTE] ([DOCUMENTO_IDENTIDAD])
GO
ALTER TABLE [dbo].[FORMULARIO_110] CHECK CONSTRAINT [FK_FORMULAR_RELATIONS_DEPENDIE]
GO
ALTER TABLE [dbo].[FORMULARIO_110]  WITH CHECK ADD  CONSTRAINT [FK_FORMULAR_RELATIONS_LUGAR] FOREIGN KEY([LUGAR_PRESENTACION])
REFERENCES [dbo].[LUGAR_EXPEDICION] ([ID_LUGAR])
GO
ALTER TABLE [dbo].[FORMULARIO_110] CHECK CONSTRAINT [FK_FORMULAR_RELATIONS_LUGAR]
GO
