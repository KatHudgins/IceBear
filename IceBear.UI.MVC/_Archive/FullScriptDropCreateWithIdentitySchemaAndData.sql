/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT IF EXISTS [FK_LessonViews_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT IF EXISTS [FK_LessonViews_Lessons]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
ALTER TABLE [dbo].[Lessons] DROP CONSTRAINT IF EXISTS [FK_Lessons_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT IF EXISTS [FK_CourseCompletions_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT IF EXISTS [FK_CourseCompletions_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 1/13/2021 10:56:23 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 1/13/2021 10:56:23 AM ******/
DROP TABLE IF EXISTS [dbo].[LessonViews]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 1/13/2021 10:56:23 AM ******/
DROP TABLE IF EXISTS [dbo].[Lessons]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 1/13/2021 10:56:23 AM ******/
DROP TABLE IF EXISTS [dbo].[Courses]
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 1/13/2021 10:56:23 AM ******/
DROP TABLE IF EXISTS [dbo].[CourseCompletions]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/13/2021 10:56:23 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/13/2021 10:56:23 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/13/2021 10:56:23 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/13/2021 10:56:23 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/13/2021 10:56:23 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/13/2021 10:56:23 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/13/2021 10:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/13/2021 10:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/13/2021 10:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/13/2021 10:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/13/2021 10:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/13/2021 10:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 1/13/2021 10:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CourseCompletions](
	[CourseCompletionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[CourseId] [int] NOT NULL,
	[DateCompleted] [date] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 1/13/2021 10:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](200) NOT NULL,
	[CourseDescription] [varchar](4000) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 1/13/2021 10:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lessons](
	[LessonId] [int] IDENTITY(1,1) NOT NULL,
	[LessonTitle] [varchar](200) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Introduction] [varchar](300) NULL,
	[VideoURL] [varchar](250) NULL,
	[PdfFileName] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[LessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 1/13/2021 10:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LessonViews](
	[LessonViewId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[LessonId] [int] NOT NULL,
	[DateViewed] [date] NOT NULL,
 CONSTRAINT [PK_LessonViews] PRIMARY KEY CLUSTERED 
(
	[LessonViewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 1/13/2021 10:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202101051452065_InitialCreate', N'IceBear.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FDBB8127E5FE0FC07414F7B16592B976DD113382D52273927D8E6823A29F6ADA025DA112A515A894A131CEC2F3B0FFB93F62F9CA144C9E24D175BB19D4581C22287DF0C874372381CE6AFFFFD39FEF01406D6234E523F2227F6C168DFB6307123CF278B133BA3F39FDFD91FDEFFE387F1B9173E595F4ABA2346072D497A623F501A1F3B4EEA3EE010A5A3D07793288DE674E446A183BCC839DCDFFF977370E06080B001CBB2C69F3342FD10E71FF03989888B639AA1E02AF27090F272A899E6A8D6350A711A23179FD8972EFE885132BABF1C5D7D998C8A06B6751AF8088499E2606E5B889088220AA21EDFA7784A93882CA63114A0E0EE39C6403747418A79178E97E45D7BB37FC87AE32C1B96506E96D228EC097870C4D5E3C8CD5752B25DA90F14780E8AA6CFACD7B912417F1ECE8B3E4701284066783C0912467C625F552C4ED3F81AD351D97054405E2400F73D4ABE8DEA887B56E7767B95391D8EF6D9BF3D6B9205344BF009C1194D50B067DD66B3C0777FC5CF77D1374C4E8E0E66F3A3776FDE22EFE8ED2FF8E84DBDA7D057A0130AA0E83689629C806C785EF5DFB61CB19D2337AC9AD5DA145A015B8299615B57E8E913260BFA0073E6F09D6D5DF84FD82B4BB871DD131F261234A249069FD75910A05980AB7AA79127FBBF81EBE19BB78370BD468FFE221F7A893F4C9C04E6D5671CE4B5E9831F17D34B18EFAF9CEC228942F62DDA5751FB751A6589CB3A131949EE50B2C054946EEC2C8DB7934933A8E1CDBA44DD7DD36692AAE6AD25651D5A6526942C363D1B4A795F966F678B3B8D6318BCDCB498469A0C4EBB5F8D24803D4B245B1AD041570322D0B1BFF37A781E223F186041ECC005DC91B99F84B8EAE5C708CC0F91DE32DFA23485F5C0FB0F4A1F1A44879F03883EC56E9680994E290AE317E776FB10117C9D853366FD9BE335D8D0DC7D8F2E904BA3E49CB0566BE37D8ADC6F5146CF89778628BEA76E09C83EEFFCB03BC020E29CBA2E4ED30B3066EC4D22F0B64BC04B428F0E7BC3B1356ADB0EC924407EA8F748A4D5F46B49BAF44AF4148A676220D379274DA27E8A163EE9266A496A16B5A068159593F5159581759394539A05CD095AE52CA806F3F7F2111ADEE1CB6177DFE35B6FF336AD0535354E6185C4FFC60427B08C79B788529C90E508745937B6E12CE4C3C798BEF8DE9473FA82826C68562BCD867C11187E36E4B0BB3F1B7231A1F8D1F79857D2E1185412037C277AFD09AB7DCE49926D7A3A08DDDC34F3CDAC01A6E9729AA691EBE7B3401300E3E10B517EF0E1ACF65846D11B391E021D0343F7D9960725D0375B36AA1B7286034CB175EA1601C2094A5DE4A96A840E793D042B77548D60CBB88828DC4F0A4FB0749CB046881D825298A93EA1EAB4F089EBC72868D592D4B2E316C6FA5EF1906BCE708C0963D8AA892ECCF561102640C5471A94360D8D9D9AC5351BA2C16B358D799B0BBB1C77253AB1119B6CF19D0D76C9FDB71731CC668D6DC0389B55D2450063486F1B06CACF2A5D0D403EB8EC9A814A2726838172976A23062A6A6C0B062AAAE4D519687144ED3AFED27975D7CC533C286F7E5B6F54D7166C53D0C78E9966E17B421B0A2D70A29AE7D98C55E227AA399C819CFC7C967257573611063EC5540CD92CFD5DAD1FEA3483C846D404B834B416507E19A8002913AA8770652CAF513AEE45F4802DE36E8DB07CED97606B36A062D72F456B84E6AB53D9383B9D3EAA9E55D6A01879A7C3420D476310F2E22576BC83524C715955315D7CE13EDE70AD637C301A14D4E2B91A94547666702D95A6D9AE259D43D6C7255B4B4B92FB64D052D999C1B5C46DB45D491AA7A0875BB0968AC42D7CA0C956463AAADDA6AA1B3B45BA142F183B86BCAAF1158A639F2C6A7956BCC49A164956939FA7FD538FC202C371534D0652256DC58946095A60A9165883A4177E92D23344D10CB138CFC40B1532EDDE6A58FE4B96F5ED531DC4721F28A9D96FBEB66BAFF085ED56F54738CC057432644E4D1E49D79880BEB9C552DF5080124DF07E12055948CC3E96B9757185576F5F94A8086347925FF1A11485299EAEA8FD4E63A3CE8BE1C6A9F262561F2B338449E3A50F5AD7B9C92F35A39461AA3A8A2974B5B5B133B9337DC74B7616FB0F572BC2CBCC2E9EA15207E0453D316A490E0A58ADAE3BAA988752C7146BBA234AC9267548A9AA8794F5941241C87AC54A78068DEA29BA73509348EAE86A6D77644D3A491D5A53BD02B64666B9AE3BAA26E3A40EACA9EE8EBD4C3F91D7D11DDEBF8C47987536B0E2A0BBDE0E66C078994571980DB0769F5F07AA15F7C4E237F60A182FDF4983329EF6D631A822C4B19E411930CCEB8F70192E2E3F8D37F8664CE1865B58E29B6EF8CD78FDCCF6458D4339EFC92415F7EADC279DEFC6FCACD5FEB846397C1524B655AA11B6F7E794E270C40846D3DF8349E063B69897045788F8739CD222ABC33EDC3F38941EE7ECCE4319274DBD40735635BD9611C76C03095AE41125EE034AD47489351E932C419548F425F1F0D389FDDFBCD5711ED460BFF2E23DEB32BD27FEEF1954DC2519B6FE50D33F8749AEEFF09CA312F48F57F14EA2BBCA2F7FFB5A34DDB36E12984EC7D6BEA4E855865F7C3DD14B9AA2E91AD2ACFCA6E2F5CE36E1A98216559A2DABBF4C98F974905709A5943F86E8E99F7D45D3BE3C580B51F3BA6028BC4154687A3DB00A96F1E580079F347F39D0AFB3FA9704AB88667C45E093FE60F21B82EECB50D9728BFB90E6CCB4892529D7736B0EF65A0999DBDE9B9454EDB526BA9A8EDD036ED094EBF55C945796CA3CD8D6A9C9541E0C7B9B76FFE2E9C9BB9291BC74DAB79B88BCC9DCE3869BA5BF55CAF10E24C969927EB69F58BC695B330581773C3BB35FFAF08E191BDFE6B79F24BC696333058877DCD87AA502EF98AD6D6BFFDCB2A575DE42B79ED8ABE628192E737451E4B6C4DD22E40EC7FF590446507894C57B4B7DA65853966B0BC3258999A939454D66AC4C1C85AF42D1CCB65F5FF986DFD8594ED3CCD690D8D9C49BAFFF8DBC394D336F43BAE436528EB5098BBA34F09675AC298FEA35A5180B3D69C9686FF3591B6FE65F5346F1204A11668FE176F9F524100FA29221A74E8F8461F5A218F6CEDADF6A84FD3BF5174B08F6971B0976855DB3A2B924F3A8DCBC25894A122942738529F2604B3D4DA83F472E856A1680CE1F8CE7413D760D32C3DE25B9C9689C51E8320E678110F0624E4013FF3C2B5A94797C13B3AF74882E80983E0BDCDF908F991F7895DC179A9890018279173CDCCBC692B2B0EFE2B942BA8E484720AEBECA29BAC3611C00587A43A6E811AF221B98DF27BC40EEF332026802691F0851EDE3331F2D1214A61C63D91E3EC186BDF0E9FDFF01D4DC8398B2540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'adad56ac-8d46-4ad1-9e3f-71c345f3915c', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'446bed55-fcab-4a64-80dd-c023e951bdbd', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'438dfff4-1dd8-41cf-a47f-b194fb4fa894', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0869b9d1-03c0-4790-b52f-8490c3637db5', N'438dfff4-1dd8-41cf-a47f-b194fb4fa894')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'434c0b39-9097-4d22-ad6d-540aa8d0a071', N'446bed55-fcab-4a64-80dd-c023e951bdbd')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'971df1e6-38c5-4a6e-acc4-ff78e8ffd371', N'446bed55-fcab-4a64-80dd-c023e951bdbd')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'df6c2cc3-80c0-4532-9622-01d357fe355a', N'adad56ac-8d46-4ad1-9e3f-71c345f3915c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0869b9d1-03c0-4790-b52f-8490c3637db5', N'Themoonbug@aol.com', 1, N'AN+BmFl7gFhZTRsznFb3mKPiSIbI72IOg4zg3ot/b7/xGHx1YD5LsP06dFcqLysNXw==', N'42d5a7af-9e29-44fc-948d-18c064a23437', NULL, 0, 0, NULL, 1, 0, N'Themoonbug@aol.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'434c0b39-9097-4d22-ad6d-540aa8d0a071', N'KathrynRosella@gmail.com', 0, N'AJFrwZV3+PKi+y18PSXDaEijlB3/Lv+tWFyrfRsfBo2YM5PuhXqmaQ+X4WOJbwNRUQ==', N'a5d995d7-12d9-456e-bb97-900282a5c3fd', NULL, 0, 0, NULL, 1, 0, N'KathrynRosella@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'971df1e6-38c5-4a6e-acc4-ff78e8ffd371', N'Hudginskr@hotmail.com', 0, N'AFpwgNIB7xKXAC8B5BAFKv5VT3vTy433K2SZh4a+fTjBLxMlHCtGkFCYcilynrWPcw==', N'89c17941-4df4-408f-8f92-29ceb2b5aa7e', NULL, 0, 0, NULL, 1, 0, N'Hudginskr@hotmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'df6c2cc3-80c0-4532-9622-01d357fe355a', N'Hudginskr@outlook.com', 0, N'AH+TsZ/8tz6wc8bhdzsJPVnZeH33dpmrG+nVCrteQc6C2sGxkRQUa3MIbgXBG8UxNQ==', N'cda9a958-7ed9-4837-9705-5a6304c98cc6', NULL, 0, 0, NULL, 1, 0, N'Hudginskr@outlook.com')
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (1, N'Motor Controls', N'Explain the fundamental concepts of designing, providing, and maintaining electrical control for motors. The class content first addresses the main elements of motors and the principles that make motors work, with several classes devoted to reading the symbols and line diagrams used to represent electrical circuits. Advanced-level classes focus on simple to complex control devices--the physical switches, contactors, and relays that open and close electrical circuits, allowing motors to perform useful work.', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (2, N'Programmable Logic Controllers', N'A programmable logic controller (PLC) or programmable controller is a digital computer used for automation of electromechanical processes, such as control of machinery on factory assembly lines, amusement rides, or lighting fixtures. PLCs are used in many industries and machines, such as packaging and semiconductor machines. Unlike general-purpose computers, the PLC is designed for multiple inputs and output arrangements, extended temperature ranges, immunity to electrical noise, and resistance to vibration and impact. Programs to control machine operation are typically stored in battery-backed or non-volatile memory. A PLC is an example of a real time system since output results must be produced in response to input conditions within a bounded time, otherwise unintended operation will result. This course will begin by examining the system components in a SLC 500 modular PLC system and the AB SLC 500 family PLC’s. Then, the course will explore the programmable controller fundamentals and system installation as well as programming software. The course will conclude with lessons on timers and counters, as well as shift registers and sequences', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (3, N'Instrumentation', N'Introduction to the basics of instrumentation, including definition of commonly used instrumentation terms and symbols, and an overview of the physical parameters of industrial measurement and control; pressure, flow, level, and temperature. Covers complex material such as; configuration and calibration, including proper documentation. Both bench calibration of analog instruments and communicating with and configuring digital or “smart” instruments are covered in great detail. The class finishes with fundamental of automated process control, control valves and control valve maintenance, analytical instrumentation, and instrument installation and tubing.', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (4, N'Lighting Control', N'he main focus of this class will be to familiarize the students with the standard Title 24 requirements, LED lighting systems, various control strategies and concepts for meeting the Title 24 requirements. I will then will use labs to get them hands-on training with a variety of current, popular control systems and the individual devices used in these systems.

', 0)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (13, N'Photovoltaic Systems', N'Examine solar cells to learn how they convert the sun''s energy directly into electricity. In the process, you will learn why we are getting closer to using the sun''s energy on a daily basis, and why we still have more research to do before the process becomes cost effective.', 1)
INSERT [dbo].[Courses] ([CourseId], [CourseName], [CourseDescription], [IsActive]) VALUES (14, N'Fire Alarm', N'

Fire Alarm
Code Reference: NEC article 760 Fire Alarm Systems, NFPA 72 National Fire Alarm and Signaling Code Fire alarm Symbology and Terminology How to read and interpret FA drawings Installation preparation and execution Field circuit testing Wiring and interfacing FA systems with emergency control functions Lab portion with hands on install, testing, and troubleshooting', 0)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (2, N'Intermediate', 1, N'noImage.jpg', NULL, NULL, 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (3, N'Advanced', 1, N'noImage.jpg', NULL, NULL, 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (4, N'Beginner', 2, N'noImage.jpg', NULL, N'PLC.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (5, N'Intermediate', 2, N'noImage.jpg', NULL, NULL, 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (6, N'Advanced', 2, N'noImage.jpg', NULL, NULL, 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (7, N'Beginner', 3, N'noImage.jpg', NULL, N'Instrumentation.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (8, N'Intermediate', 3, N'noImage.jpg', NULL, NULL, 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (9, N'Advanced', 3, N'noImage.jpg', NULL, NULL, 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (10, N'Beginner', 4, N' noImage.jpg', NULL, N'Lighting Controls.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (11, N'Intermediate', 4, N'noImage.jpg', NULL, NULL, 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (12, N'Advanced', 4, N'noImage.jpg', NULL, NULL, 0)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (13, N'test', 1, N'noImage.jpg', N'https://www.youtube.com/watch?v=aml0VGzNXEo', N'DCMotor_AhmedAlnaib.pdf', 1)
INSERT [dbo].[Lessons] ([LessonId], [LessonTitle], [CourseId], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (14, N'test', 1, N'noImage.jpg', N'https://www.youtube.com/embed/aml0VGzNXEo', N'DCMotor_AhmedAlnaib.pdf', 1)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
SET IDENTITY_INSERT [dbo].[LessonViews] ON 

INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (2, N'df6c2cc3-80c0-4532-9622-01d357fe355a', 2, CAST(N'1990-12-19' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (3, N'df6c2cc3-80c0-4532-9622-01d357fe355a', 13, CAST(N'2021-01-13' AS Date))
INSERT [dbo].[LessonViews] ([LessonViewId], [UserId], [LessonId], [DateViewed]) VALUES (4, N'df6c2cc3-80c0-4532-9622-01d357fe355a', 14, CAST(N'2021-01-13' AS Date))
SET IDENTITY_INSERT [dbo].[LessonViews] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName]) VALUES (N'df6c2cc3-80c0-4532-9622-01d357fe355a', N'Kada', N'Gray')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_Lessons] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([LessonId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_Lessons]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
