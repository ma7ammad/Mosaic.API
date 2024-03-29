USE [MosaicIdPDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29/03/2021 12:41:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceClaims]    Script Date: 29/03/2021 12:41:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceProperties]    Script Date: 29/03/2021 12:41:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResources]    Script Date: 29/03/2021 12:41:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[AllowedAccessTokenSigningAlgorithms] [nvarchar](100) NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_ApiResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceScopes]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiResourceSecrets]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResourceSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_ApiResourceSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopeClaims]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_ApiScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopeProperties]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_ApiScopeProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopes]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_ApiScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientClaims]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientCorsOrigins]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCorsOrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Origin] [nvarchar](150) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientGrantTypes]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientGrantTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GrantType] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientGrantTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientIdPRestrictions]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientIdPRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientPostLogoutRedirectUris]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPostLogoutRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostLogoutRedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientProperties]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientRedirectUris]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[ProtocolType] [nvarchar](200) NOT NULL,
	[RequireClientSecret] [bit] NOT NULL,
	[ClientName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[ClientUri] [nvarchar](2000) NULL,
	[LogoUri] [nvarchar](2000) NULL,
	[RequireConsent] [bit] NOT NULL,
	[AllowRememberConsent] [bit] NOT NULL,
	[AlwaysIncludeUserClaimsInIdToken] [bit] NOT NULL,
	[RequirePkce] [bit] NOT NULL,
	[AllowPlainTextPkce] [bit] NOT NULL,
	[RequireRequestObject] [bit] NOT NULL,
	[AllowAccessTokensViaBrowser] [bit] NOT NULL,
	[FrontChannelLogoutUri] [nvarchar](2000) NULL,
	[FrontChannelLogoutSessionRequired] [bit] NOT NULL,
	[BackChannelLogoutUri] [nvarchar](2000) NULL,
	[BackChannelLogoutSessionRequired] [bit] NOT NULL,
	[AllowOfflineAccess] [bit] NOT NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[AllowedIdentityTokenSigningAlgorithms] [nvarchar](100) NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[ConsentLifetime] [int] NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[EnableLocalLogin] [bit] NOT NULL,
	[IncludeJwtId] [bit] NOT NULL,
	[AlwaysSendClientClaims] [bit] NOT NULL,
	[ClientClaimsPrefix] [nvarchar](200) NULL,
	[PairWiseSubjectSalt] [nvarchar](200) NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[UserSsoLifetime] [int] NULL,
	[UserCodeType] [nvarchar](100) NULL,
	[DeviceCodeLifetime] [int] NOT NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientScopes]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientSecrets]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_ClientSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceCodes]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceCodes](
	[UserCode] [nvarchar](200) NOT NULL,
	[DeviceCode] [nvarchar](200) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DeviceCodes] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResourceClaims]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_IdentityResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResourceProperties]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_IdentityResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentityResources]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_IdentityResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersistedGrants]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersistedGrants](
	[Key] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[ConsumedTime] [datetime2](7) NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PersistedGrants] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29/03/2021 12:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Subject] [nvarchar](200) NOT NULL,
	[UserName] [nvarchar](15) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FistName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[SecurityCode] [nvarchar](200) NULL,
	[SecurityCodeExpirationDate] [datetime2](7) NOT NULL,
	[BirthDate] [datetime2](7) NOT NULL,
	[Active] [bit] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210307210643_InitialIddPConfigDMMigration', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210307211002_InitialIddPOperationalDMMigration', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210307212617_InitialIddPUsersDMMigration', N'3.1.10')
GO
SET IDENTITY_INSERT [dbo].[ApiResourceClaims] ON 

INSERT [dbo].[ApiResourceClaims] ([Id], [Type], [ApiResourceId]) VALUES (1, N'role', 1)
SET IDENTITY_INSERT [dbo].[ApiResourceClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiResources] ON 

INSERT [dbo].[ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (1, 1, N'mosaicapi', N'Mosaic API', NULL, NULL, 1, CAST(N'2021-03-07T21:07:49.2932709' AS DateTime2), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ApiResources] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiResourceScopes] ON 

INSERT [dbo].[ApiResourceScopes] ([Id], [Scope], [ApiResourceId]) VALUES (1, N'mosaicapi', 1)
SET IDENTITY_INSERT [dbo].[ApiResourceScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiResourceSecrets] ON 

INSERT [dbo].[ApiResourceSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ApiResourceId]) VALUES (1, NULL, N'G0AdeileQgO4vXaumiNXUiBC44NDbCUQW+uZfnW2jMQ=', NULL, N'SharedSecret', CAST(N'2021-03-07T21:07:49.2934148' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[ApiResourceSecrets] OFF
GO
SET IDENTITY_INSERT [dbo].[ApiScopes] ON 

INSERT [dbo].[ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (1, 1, N'mosaicapi', N'Mosaic API Scope', NULL, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[ApiScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] ON 

INSERT [dbo].[ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (1, N'authorization_code', 1)
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] ON 

INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [PostLogoutRedirectUri], [ClientId]) VALUES (1, N'https://localhost:44389/signout-callback-oidc', 1)
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] ON 

INSERT [dbo].[ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (1, N'https://localhost:44389/signin-oidc', 1)
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (1, 1, N'mosaicclient', N'oidc', 1, N'Mosaic', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, NULL, 1, NULL, 1, 1, 300, NULL, 120, 300, NULL, 2592000, 1296000, 1, 1, 1, 1, 1, 1, 0, N'client_', NULL, CAST(N'2021-03-07T21:07:47.4506396' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientScopes] ON 

INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1, N'openid', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2, N'profile', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (3, N'email', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (4, N'address', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (5, N'roles', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (6, N'BirthDate', 1)
INSERT [dbo].[ClientScopes] ([Id], [Scope], [ClientId]) VALUES (7, N'mosaicapi', 1)
SET IDENTITY_INSERT [dbo].[ClientScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientSecrets] ON 

INSERT [dbo].[ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (1, NULL, N'K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=', NULL, N'SharedSecret', CAST(N'2021-03-07T21:07:47.4535292' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[ClientSecrets] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentityResourceClaims] ON 

INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (1, N'website', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (2, N'address', 4)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (3, N'email_verified', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (4, N'email', 3)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (5, N'sub', 2)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (6, N'updated_at', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (7, N'locale', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (8, N'zoneinfo', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (9, N'birthdate', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (10, N'gender', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (11, N'name', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (12, N'family_name', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (13, N'given_name', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (14, N'middle_name', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (15, N'nickname', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (16, N'preferred_username', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (17, N'profile', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (18, N'picture', 1)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (19, N'role', 5)
INSERT [dbo].[IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (20, N'BirthDate', 6)
SET IDENTITY_INSERT [dbo].[IdentityResourceClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentityResources] ON 

INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (1, 1, N'profile', N'User profile', N'Your user profile information (first name, last name, etc.)', 0, 1, 1, CAST(N'2021-03-07T21:07:48.6260795' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (2, 1, N'openid', N'Your user identifier', NULL, 1, 0, 1, CAST(N'2021-03-07T21:07:48.5451096' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (3, 1, N'email', N'Your email address', NULL, 0, 1, 1, CAST(N'2021-03-07T21:07:48.6487018' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (4, 1, N'address', N'Your postal address', NULL, 0, 1, 1, CAST(N'2021-03-07T21:07:48.6905403' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (5, 1, N'roles', N'Your roles(s)', NULL, 0, 0, 1, CAST(N'2021-03-07T21:07:48.7084513' AS DateTime2), NULL, 0)
INSERT [dbo].[IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (6, 1, N'BirthDate', N'Date Of Birht', NULL, 0, 0, 1, CAST(N'2021-03-07T21:07:48.7093372' AS DateTime2), NULL, 0)
SET IDENTITY_INSERT [dbo].[IdentityResources] OFF
GO
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'EVauR+/6ikTuPpbkkImd4gRE0L03XhVMwjBOZgazEXY=', N'refresh_token', N'd860efca-22d9-47fd-8249-791ba61b07c7', N'CAF26F50B2684F3D82CAD8A0BA07B49B', N'mosaicclient', NULL, CAST(N'2021-03-07T21:31:46.0000000' AS DateTime2), CAST(N'2021-04-06T21:31:46.0000000' AS DateTime2), CAST(N'2021-03-07T21:34:40.0000000' AS DateTime2), N'{"CreationTime":"2021-03-07T21:31:46Z","Lifetime":2592000,"ConsumedTime":"2021-03-07T21:34:40Z","AccessToken":{"AllowedSigningAlgorithms":[],"Confirmation":null,"Audiences":["mosaicapi","https://localhost:44318/resources"],"Issuer":"https://localhost:44318","CreationTime":"2021-03-07T21:31:46Z","Lifetime":120,"Type":"access_token","ClientId":"mosaicclient","AccessTokenType":1,"Description":null,"Claims":[{"Type":"client_id","Value":"mosaicclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"email","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"mosaicapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1615152704","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"Admin","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"jti","Value":"C8128549B601C266EBC171FEDA66D1B8","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sid","Value":"CAF26F50B2684F3D82CAD8A0BA07B49B","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"iat","Value":"1615152706","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}],"Version":4},"Version":4}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'kfeIWPwBgC8TIrphacN8SCtK6DSOLXxDCOhUow3fPdA=', N'reference_token', N'd860efca-22d9-47fd-8249-791ba61b07c7', NULL, N'mosaicclient', NULL, CAST(N'2021-03-07T22:31:44.0000000' AS DateTime2), CAST(N'2021-03-07T22:33:44.0000000' AS DateTime2), NULL, N'{"AllowedSigningAlgorithms":[],"Confirmation":null,"Audiences":["mosaicapi","https://localhost:44318/resources"],"Issuer":"https://localhost:44318","CreationTime":"2021-03-07T22:31:44Z","Lifetime":120,"Type":"access_token","ClientId":"mosaicclient","AccessTokenType":1,"Description":null,"Claims":[{"Type":"client_id","Value":"mosaicclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"email","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"mosaicapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1615156217","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"Admin","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"jti","Value":"E6D10314839662F7F7BC14440FA2A770","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"iat","Value":"1615156304","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}],"Version":4}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'kzUDlD/hdAkM2E+2ya9j//k1jpoj+LVWDIrgq3HNsyQ=', N'refresh_token', N'd860efca-22d9-47fd-8249-791ba61b07c7', N'C88F09BF8CFC19F89218AAC058F6BD70', N'mosaicclient', NULL, CAST(N'2021-03-07T22:30:20.0000000' AS DateTime2), CAST(N'2021-04-06T22:30:20.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-03-07T22:30:20Z","Lifetime":2592000,"ConsumedTime":null,"AccessToken":{"AllowedSigningAlgorithms":[],"Confirmation":null,"Audiences":["mosaicapi","https://localhost:44318/resources"],"Issuer":"https://localhost:44318","CreationTime":"2021-03-07T22:30:20Z","Lifetime":120,"Type":"access_token","ClientId":"mosaicclient","AccessTokenType":1,"Description":null,"Claims":[{"Type":"client_id","Value":"mosaicclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"email","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"mosaicapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1615156217","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"Admin","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"jti","Value":"B5B5CB676BA837A06D8DE1E618AEDEFB","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sid","Value":"C88F09BF8CFC19F89218AAC058F6BD70","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"iat","Value":"1615156220","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}],"Version":4},"Version":4}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'o6Mof3zDL3k4yqF5+yyYj0XvYA3pzecHqJd2XN1z+Zo=', N'reference_token', N'd860efca-22d9-47fd-8249-791ba61b07c7', N'C88F09BF8CFC19F89218AAC058F6BD70', N'mosaicclient', NULL, CAST(N'2021-03-07T22:30:20.0000000' AS DateTime2), CAST(N'2021-03-07T22:32:20.0000000' AS DateTime2), NULL, N'{"AllowedSigningAlgorithms":[],"Confirmation":null,"Audiences":["mosaicapi","https://localhost:44318/resources"],"Issuer":"https://localhost:44318","CreationTime":"2021-03-07T22:30:20Z","Lifetime":120,"Type":"access_token","ClientId":"mosaicclient","AccessTokenType":1,"Description":null,"Claims":[{"Type":"client_id","Value":"mosaicclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"email","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"mosaicapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1615156217","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"Admin","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"jti","Value":"B5B5CB676BA837A06D8DE1E618AEDEFB","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sid","Value":"C88F09BF8CFC19F89218AAC058F6BD70","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"iat","Value":"1615156220","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}],"Version":4}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'OmvAl+vXGAypXfOPNfhnp5Iaq/eRsX7JL6B3CNTvOv8=', N'refresh_token', N'd860efca-22d9-47fd-8249-791ba61b07c7', N'C88F09BF8CFC19F89218AAC058F6BD70', N'mosaicclient', NULL, CAST(N'2021-03-07T22:30:20.0000000' AS DateTime2), CAST(N'2021-04-06T22:30:20.0000000' AS DateTime2), CAST(N'2021-03-07T22:31:44.0000000' AS DateTime2), N'{"CreationTime":"2021-03-07T22:30:20Z","Lifetime":2592000,"ConsumedTime":"2021-03-07T22:31:44Z","AccessToken":{"AllowedSigningAlgorithms":[],"Confirmation":null,"Audiences":["mosaicapi","https://localhost:44318/resources"],"Issuer":"https://localhost:44318","CreationTime":"2021-03-07T22:30:20Z","Lifetime":120,"Type":"access_token","ClientId":"mosaicclient","AccessTokenType":1,"Description":null,"Claims":[{"Type":"client_id","Value":"mosaicclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"email","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"mosaicapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1615156217","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"Admin","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"jti","Value":"B5B5CB676BA837A06D8DE1E618AEDEFB","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sid","Value":"C88F09BF8CFC19F89218AAC058F6BD70","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"iat","Value":"1615156220","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}],"Version":4},"Version":4}')
INSERT [dbo].[PersistedGrants] ([Key], [Type], [SubjectId], [SessionId], [ClientId], [Description], [CreationTime], [Expiration], [ConsumedTime], [Data]) VALUES (N'opVXI/S40dU9tXaC+u/RTRSb1+1iey49vGNxB3Crx88=', N'refresh_token', N'b7539694-97e7-4dfe-84da-b4256e1ff5c7', N'0B2C6AADCE328FDA1025729E21EA4758', N'mosaicclient', NULL, CAST(N'2021-03-07T21:36:18.0000000' AS DateTime2), CAST(N'2021-04-06T21:36:18.0000000' AS DateTime2), NULL, N'{"CreationTime":"2021-03-07T21:36:18Z","Lifetime":2592000,"ConsumedTime":null,"AccessToken":{"AllowedSigningAlgorithms":[],"Confirmation":null,"Audiences":["mosaicapi","https://localhost:44318/resources"],"Issuer":"https://localhost:44318","CreationTime":"2021-03-07T21:36:18Z","Lifetime":120,"Type":"access_token","ClientId":"mosaicclient","AccessTokenType":1,"Description":null,"Claims":[{"Type":"client_id","Value":"mosaicclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"email","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"mosaicapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"b7539694-97e7-4dfe-84da-b4256e1ff5c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1615152977","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"User","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"jti","Value":"CAD7389F4BBFBE6C2885F7C193F10058","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sid","Value":"0B2C6AADCE328FDA1025729E21EA4758","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"iat","Value":"1615152978","ValueType":"http://www.w3.org/2001/XMLSchema#integer64"}],"Version":4},"Version":4}')
GO
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'676e1ed4-357e-4f31-f57d-08d8e53c8c2a', N'address', N'address1', N'892ea287-2f60-44af-b1bf-6e2d0eab50ad', N'8336cfaa-b4ae-4fee-791d-08d8e53c8c27')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'76aad302-fcc7-4958-f57e-08d8e53c8c2a', N'given_name', N'first1', N'429aa952-9849-4ea5-811d-208d28450f7d', N'8336cfaa-b4ae-4fee-791d-08d8e53c8c27')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'9408f726-9b4a-46df-f57f-08d8e53c8c2a', N'family_name', N'last1', N'c54f9f20-dee8-4c2c-b77c-36237324737d', N'8336cfaa-b4ae-4fee-791d-08d8e53c8c27')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'6ce97aaa-0971-4294-f580-08d8e53c8c2a', N'email', N'test@mail.com', N'513c0dfb-4a1d-45ff-bdbb-61fc3d86ac42', N'8336cfaa-b4ae-4fee-791d-08d8e53c8c27')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'15cab80b-22ce-48d4-f581-08d8e53c8c2a', N'birthdate', N'01/01/2001 00:00:00', N'f4fb35f3-4209-4d77-ae29-87c76ef3d199', N'8336cfaa-b4ae-4fee-791d-08d8e53c8c27')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'36d7856a-d05b-451b-f582-08d8e53c8c2a', N'role', N'Admin', N'93dec8c0-0c3d-47c9-b0fc-d8370bbdefd3', N'8336cfaa-b4ae-4fee-791d-08d8e53c8c27')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'78799e02-26cf-4b2c-be31-1a09501fc6e2', N'family_name', N'Underwood', N'531dff28-5d13-43bc-9c7b-53014013b6e4', N'13229d33-99e0-41b3-b18d-4f72127e3971')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'a54c86c4-4a9f-46c0-a97f-646d4c1ead29', N'given_name', N'Claire', N'abf5cddf-4e36-42ac-b586-77c147a50ae2', N'96053525-f4a5-47ee-855e-0ea77fa6c55a')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'743e0896-4c6f-4eb4-a7e1-670452267a5c', N'email', N'frank@someprovider.com', N'0a4497f3-8e0a-4999-8e60-e0d3885fe617', N'13229d33-99e0-41b3-b18d-4f72127e3971')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'672fea9a-d33e-4b1f-8c21-685d6922929b', N'role', N'User', N'b9862322-c0f8-4397-a9cf-d7a09273beb8', N'96053525-f4a5-47ee-855e-0ea77fa6c55a')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'0985215b-19c9-4c69-afea-72c5d67ad468', N'family_name', N'Underwood', N'a0dc13e8-c323-438b-9e81-39aaa2c2a258', N'96053525-f4a5-47ee-855e-0ea77fa6c55a')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'15ed2948-e64d-4ade-b84d-85e69f892198', N'given_name', N'Frank', N'0148ba70-1678-4b8b-9457-0fa966602373', N'13229d33-99e0-41b3-b18d-4f72127e3971')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'ccd86630-a20a-4d86-bf69-90e250fcaa61', N'email', N'claire@someprovider.com', N'eebf676a-b83b-4bd1-94f1-5dfa6f6f3c04', N'96053525-f4a5-47ee-855e-0ea77fa6c55a')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'62213034-b83f-4f84-ac88-c753f0e0e756', N'address', N'Big Street 2', N'f12480ee-8865-4df9-986a-11003b9e5647', N'96053525-f4a5-47ee-855e-0ea77fa6c55a')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'42e3b0e9-3f3d-45a4-8cd9-ed390c1a1607', N'address', N'Main Road 1', N'fb8de850-9c3d-4803-8257-3c4dd1a6ba3b', N'13229d33-99e0-41b3-b18d-4f72127e3971')
INSERT [dbo].[UserClaims] ([Id], [Type], [Value], [ConcurrencyStamp], [UserId]) VALUES (N'ed12068b-f945-4f14-9a30-fe9f4367f559', N'role', N'Admin', N'c2440533-c58e-4ce4-a6d6-0e99fd53d3b2', N'13229d33-99e0-41b3-b18d-4f72127e3971')
GO
INSERT [dbo].[Users] ([Id], [Subject], [UserName], [Password], [FistName], [LastName], [Email], [SecurityCode], [SecurityCodeExpirationDate], [BirthDate], [Active], [ConcurrencyStamp]) VALUES (N'8336cfaa-b4ae-4fee-791d-08d8e53c8c27', N'366c62aa-98b9-493e-90f5-5ea903a1581a', N'test1', N'AQAAAAEAACcQAAAAEBJuM60UJm4Cshy6OaTcCMLUiu4kw6i1zC0+n0QcFNYfb4EcmqauuErrZ3Yo99FqOQ==', NULL, NULL, N'test@mail.com', NULL, CAST(N'2021-03-12T10:52:28.4703954' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'9b02478f-bb78-4f49-80a0-9911730b524b')
INSERT [dbo].[Users] ([Id], [Subject], [UserName], [Password], [FistName], [LastName], [Email], [SecurityCode], [SecurityCodeExpirationDate], [BirthDate], [Active], [ConcurrencyStamp]) VALUES (N'96053525-f4a5-47ee-855e-0ea77fa6c55a', N'b7539694-97e7-4dfe-84da-b4256e1ff5c7', N'Claire', N'AQAAAAEAACcQAAAAECEiSFZvU+Xi2z67lh+y1p5fVn+gNhtp8IJn7sIXIgY1ohxS+0bbBXY2DmUH6jCdbA==', NULL, NULL, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'18290643-a5e1-43ca-923d-d61fa01ffe95')
INSERT [dbo].[Users] ([Id], [Subject], [UserName], [Password], [FistName], [LastName], [Email], [SecurityCode], [SecurityCodeExpirationDate], [BirthDate], [Active], [ConcurrencyStamp]) VALUES (N'13229d33-99e0-41b3-b18d-4f72127e3971', N'd860efca-22d9-47fd-8249-791ba61b07c7', N'Frank', N'AQAAAAEAACcQAAAAECEiSFZvU+Xi2z67lh+y1p5fVn+gNhtp8IJn7sIXIgY1ohxS+0bbBXY2DmUH6jCdbA==', NULL, NULL, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'6dfef11f-53cf-41aa-bb44-2acc9316ee5f')
GO
ALTER TABLE [dbo].[ApiResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceClaims] CHECK CONSTRAINT [FK_ApiResourceClaims_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceProperties] CHECK CONSTRAINT [FK_ApiResourceProperties_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceScopes]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceScopes] CHECK CONSTRAINT [FK_ApiResourceScopes_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiResourceSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiResourceSecrets] CHECK CONSTRAINT [FK_ApiResourceSecrets_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[ApiScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeClaims] CHECK CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ApiScopeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeProperties] CHECK CONSTRAINT [FK_ApiScopeProperties_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[ClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_ClientClaims_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientClaims] CHECK CONSTRAINT [FK_ClientClaims_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientCorsOrigins] CHECK CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientGrantTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientGrantTypes] CHECK CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientIdPRestrictions] CHECK CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClientProperties_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientProperties] CHECK CONSTRAINT [FK_ClientProperties_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientRedirectUris] CHECK CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientScopes]  WITH CHECK ADD  CONSTRAINT [FK_ClientScopes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientScopes] CHECK CONSTRAINT [FK_ClientScopes_Clients_ClientId]
GO
ALTER TABLE [dbo].[ClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ClientSecrets_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientSecrets] CHECK CONSTRAINT [FK_ClientSecrets_Clients_ClientId]
GO
ALTER TABLE [dbo].[IdentityResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityResourceClaims] CHECK CONSTRAINT [FK_IdentityResourceClaims_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[IdentityResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityResourceProperties] CHECK CONSTRAINT [FK_IdentityResourceProperties_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users_UserId]
GO
