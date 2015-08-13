--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.1
-- Started on 2015-04-10 14:42:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 24577)
-- Name: dbo; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dbo;


ALTER SCHEMA dbo OWNER TO postgres;

--
-- TOC entry 183 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 183
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = dbo, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 32768)
-- Name: Actividades; Type: TABLE; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE TABLE "Actividades" (
    "Id" bigint NOT NULL,
    "Nombre" character varying(100),
    "Informacion" text,
    "Direccion" character varying(250),
    "Horarioinicial" timestamp without time zone,
    "Horariofinal" timestamp without time zone,
    "Latitud" character varying(250),
    "Longitud" character varying(250),
    "Altitud" character varying(250),
    "Accuracy" character varying(250),
    "UsuarioID" character varying(128)
);


ALTER TABLE "Actividades" OWNER TO postgres;

--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN "Actividades"."Horarioinicial"; Type: COMMENT; Schema: dbo; Owner: postgres
--

COMMENT ON COLUMN "Actividades"."Horarioinicial" IS 'creo que este campo funciona con el tipo de dato en C# Datetime';


--
-- TOC entry 181 (class 1259 OID 32788)
-- Name: ActividadesAmigos; Type: TABLE; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE TABLE "ActividadesAmigos" (
    "ActividadID" bigint NOT NULL,
    "AmigoID" character varying(128) NOT NULL
);


ALTER TABLE "ActividadesAmigos" OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 32811)
-- Name: Amigos; Type: TABLE; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE TABLE "Amigos" (
    "Id" bigint NOT NULL,
    "Idusuario" character varying(128),
    "Idamigo" character varying(128) NOT NULL
);


ALTER TABLE "Amigos" OWNER TO postgres;

--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 182
-- Name: TABLE "Amigos"; Type: COMMENT; Schema: dbo; Owner: postgres
--

COMMENT ON TABLE "Amigos" IS 'Tabla para apuntar los amigos que tienen los usuarios';


--
-- TOC entry 173 (class 1259 OID 24578)
-- Name: AspNetRoles; Type: TABLE; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE TABLE "AspNetRoles" (
    "Id" character varying(128) DEFAULT ''::character varying NOT NULL,
    "Name" character varying(256) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE "AspNetRoles" OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 24609)
-- Name: AspNetUserClaims; Type: TABLE; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE TABLE "AspNetUserClaims" (
    "Id" integer NOT NULL,
    "UserId" character varying(128) DEFAULT ''::character varying NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);


ALTER TABLE "AspNetUserClaims" OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 24607)
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE "AspNetUserClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AspNetUserClaims_Id_seq" OWNER TO postgres;

--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 176
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE "AspNetUserClaims_Id_seq" OWNED BY "AspNetUserClaims"."Id";


--
-- TOC entry 178 (class 1259 OID 24619)
-- Name: AspNetUserLogins; Type: TABLE; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE TABLE "AspNetUserLogins" (
    "LoginProvider" character varying(128) DEFAULT ''::character varying NOT NULL,
    "ProviderKey" character varying(128) DEFAULT ''::character varying NOT NULL,
    "UserId" character varying(128) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE "AspNetUserLogins" OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 24585)
-- Name: AspNetUserRoles; Type: TABLE; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE TABLE "AspNetUserRoles" (
    "UserId" character varying(128) DEFAULT ''::character varying NOT NULL,
    "RoleId" character varying(128) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE "AspNetUserRoles" OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 24592)
-- Name: AspNetUsers; Type: TABLE; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE TABLE "AspNetUsers" (
    "Id" character varying(128) DEFAULT ''::character varying NOT NULL,
    "Email" character varying(256),
    "EmailConfirmed" boolean DEFAULT false NOT NULL,
    "PasswordHash" text,
    "SecurityStamp" text,
    "PhoneNumber" text,
    "PhoneNumberConfirmed" boolean DEFAULT false NOT NULL,
    "TwoFactorEnabled" boolean DEFAULT false NOT NULL,
    "LockoutEndDateUtc" timestamp without time zone,
    "LockoutEnabled" boolean DEFAULT false NOT NULL,
    "AccessFailedCount" integer DEFAULT 0 NOT NULL,
    "UserName" character varying(256) DEFAULT ''::character varying NOT NULL,
    "Apellidos" character varying(200),
    "Nombre" character varying(200)
);


ALTER TABLE "AspNetUsers" OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 24653)
-- Name: __MigrationHistory; Type: TABLE; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE TABLE "__MigrationHistory" (
    "MigrationId" character varying(150) DEFAULT ''::character varying NOT NULL,
    "ContextKey" character varying(300) DEFAULT ''::character varying NOT NULL,
    "Model" bytea DEFAULT '\x'::bytea NOT NULL,
    "ProductVersion" character varying(32) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE "__MigrationHistory" OWNER TO postgres;

--
-- TOC entry 1929 (class 2604 OID 24612)
-- Name: Id; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserClaims" ALTER COLUMN "Id" SET DEFAULT nextval('"AspNetUserClaims_Id_seq"'::regclass);


--
-- TOC entry 2090 (class 0 OID 32768)
-- Dependencies: 180
-- Data for Name: Actividades; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY "Actividades" ("Id", "Nombre", "Informacion", "Direccion", "Horarioinicial", "Horariofinal", "Latitud", "Longitud", "Altitud", "Accuracy", "UsuarioID") FROM stdin;
\.


--
-- TOC entry 2091 (class 0 OID 32788)
-- Dependencies: 181
-- Data for Name: ActividadesAmigos; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY "ActividadesAmigos" ("ActividadID", "AmigoID") FROM stdin;
\.


--
-- TOC entry 2092 (class 0 OID 32811)
-- Dependencies: 182
-- Data for Name: Amigos; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY "Amigos" ("Id", "Idusuario", "Idamigo") FROM stdin;
\.


--
-- TOC entry 2083 (class 0 OID 24578)
-- Dependencies: 173
-- Data for Name: AspNetRoles; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY "AspNetRoles" ("Id", "Name") FROM stdin;
\.


--
-- TOC entry 2087 (class 0 OID 24609)
-- Dependencies: 177
-- Data for Name: AspNetUserClaims; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY "AspNetUserClaims" ("Id", "UserId", "ClaimType", "ClaimValue") FROM stdin;
\.


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 176
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('"AspNetUserClaims_Id_seq"', 1, false);


--
-- TOC entry 2088 (class 0 OID 24619)
-- Dependencies: 178
-- Data for Name: AspNetUserLogins; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY "AspNetUserLogins" ("LoginProvider", "ProviderKey", "UserId") FROM stdin;
\.


--
-- TOC entry 2084 (class 0 OID 24585)
-- Dependencies: 174
-- Data for Name: AspNetUserRoles; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY "AspNetUserRoles" ("UserId", "RoleId") FROM stdin;
\.


--
-- TOC entry 2085 (class 0 OID 24592)
-- Dependencies: 175
-- Data for Name: AspNetUsers; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY "AspNetUsers" ("Id", "Email", "EmailConfirmed", "PasswordHash", "SecurityStamp", "PhoneNumber", "PhoneNumberConfirmed", "TwoFactorEnabled", "LockoutEndDateUtc", "LockoutEnabled", "AccessFailedCount", "UserName", "Apellidos", "Nombre") FROM stdin;
\.


--
-- TOC entry 2089 (class 0 OID 24653)
-- Dependencies: 179
-- Data for Name: __MigrationHistory; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY "__MigrationHistory" ("MigrationId", "ContextKey", "Model", "ProductVersion") FROM stdin;
201503161211342_InitialCreate	RestAPIPlanningActivities.Models.ApplicationDbContext	\\x1f8b0800000000000400dd5cdb6ee436127d0fb0ff20e871e1b47c99194c8cee044edbde18195f30ed09f66dc096d86d61244a1129c746902fdb87fda4fd852d4a945ae245976ef5c54180605a244f158b8764b158f4fffef3dff14f2f61603de384fa1199d827a363dbc2c48d3c9f2c2776ca16df7fb47ffaf11fdf8dafbcf0c5faada877c6eb414b4227f61363f1b9e350f70987888e42df4d221a2dd8c88d42077991737a7cfc837372e26080b001cbb2c69f53c2fc10673fe0e734222e8e598a82dbc8c30115dfa16496a15a7728c434462e9ed89f3165170f370f01220494bc7099ffec331fd351ded6b62e021f815e331c2c6c0b6a450c31d0fafc0bc533964464398be1030a1e5f630cf51628a058f4e67c55bd6bc78e4f79c79c55c302ca4d298bc29e802767c2528edc7c2d7bdba525c196576073f6ca7b9dd97362df7838fbf4390ac000b2c0f36990f0ca13fbb6147141e33bcc4645c3510e799d00dc1f51f26d54453cb23ab73b2a99753a3ae6ff1d59d3346069822704a72c41c191f590ce03dffd15bf3e46df30999c9dcc17671fdf7f40ded98777f8ec7db5a7d057a857fb009f1e9228c609e8861765ff6dcba9b773e48665b34a9bdc2ac025e09f6ddda2974f982cd9134c9fd38fb675edbf60aff822c8f585f830a7a0114b52f8799706019a07b82c771a65f2ff37483d7dff6110a977e8d95f66432fc9878993c0bcfa8c83ac943ef9713ebd6ae3fd5554bb4ea290ffaef32b2ffd3a8bd2c4e59d898c551e51b2c4acaeddd85991b713a539d4f0b42e500f9fda5c5395dedaaabc43ebcc8442c4ae6743a1ef76e57666dc451cc3e065d4e21669225cdbd63592b08e2c638b15ad4ebad28a4077ffceabe45588fc608065b28314f057167e12e2b2973f47404a447aebfc80288555c2fb05d1a706d5e19f03a83ec36e9a0079670c85f1d6a53d3c4504dfa5e19ccf89ddc91a6c681eff88ae91cba2e48af0561be37d8adc6f51caae88778918fec2dc0290ff7cf4c3ee0083a873e1ba98d26b2033f6a611b8e305e00d6167a7bde1f872b56f37651a203fd4fb29d2c2fab5a8baf255f435147fc5504de7b334a9fa295afaa49baa4555b3aa798d565545b5beaa72b06e9a8a9a6645b30aad7ae6b506f302b3111ade0dcc600fdf0fdc6cf336ad051533ce6085c4ffc20427b08c790f88319c90d508745937f6e12c64c3c7856e7d6fca24fd86827468516bcd866c11187e3664b0873f1b3235e1f3b3ef71afa4c3e1a8a80cf09deaebcf5ded734ed26cd7d3a1d6cd5d0bdfcd1a609a2e179446ae9fcd024d584c0435eafa830f67b54738f2dec85112e81810dde75b1e7c81bed932a9eec9250e30c3163fedf1b0e114511779aa19a1435e0fc58a1d55a3d82a5a5257ee9f8a4c603a4e7823c40f411466aa4f983a2d7ce2fa310a5aad24b5ecb885f1be9732e4924b1c63c205b65aa28b707d70842b50ca9106a5cd4263a7c2b866221abc56d398b7b9b0ab715762163be1648bef6ce0a5f0dfb642cc668bed809ccd26e9a28031d0b70f828ab34a5702c807974323a87462321054b8543b2168dd627b2068dd246f8ea0f911b5ebf84be7d543a367fda0bcfb6dbdd15c7be066cd1e0746cddcf784360c5ae044a5e7e59c17e217a6399c819ee27c4685ab2b538483cf30ab876c56feaed60f759a4164123501ae88d6022aae0815206542f550ae88e5356a27bc881eb045dcad1156acfd126c85032a76f5aab452d17ca12a93b3d3e9a3ec59c90685e49d0e0b151c0d21e4c5abdef10e4631c56555c374f185fb78c3958e89c16830508be76a3052d199c1ad5450b3dd4a3a87ac8f4bb6919524f7c960a5a233835b4970b4dd481aa7a0875bb09189ea5bf84093ad887494bb4d593676f27c2af161ec1812afc6b7288e7db2ac2462892fd62ccfc29a7e3feb9f9014e6188e4b357949a5b6a52416256889a552100d9a5efb09659788a139e2719ea9172ad5b47bab61f92f4456b74f75108b7da0a8cdff2d5ab45decd7765ed5351188d7d0df90fb3759505dc3067d738ba7c9a100259a38fe340ad29098dd2d73ebfc36afda3effa2228c1d497fc59d526ca738bdf581e8344cea14d9ca9095becdfac366863019bff04cabe63779ab6694227855453105b4f6368c26276783a193bdc9fe23d78ab09d39275258aa00e2534f8c4a1684025629eb8e5a4f54a962d64bba234ad9285548a9a88796d59c939a92d582b5f00c16d5d7e82e41cd32a9a2aba5dd9135f92655684df11ad81a9de5b2eea89a94942ab0a6b83bf62a3f455e520f7857339e7106dad6f243f166fb9a01633bebe330db62e5eebf0a54f9dc134bdcee2b60e2fb4172cb78321c885b796464336e1930ccab52ed0ebdbe28355efc9b316b17e3b585bf2931c08cd78fc15be589724c94ab94d2cbe3a2742c1c8b235afba31de5cc9657b1adc28c70ba8897f4f760f5e516117f018ccbb33fec1f46ef4627d2db9ec37967e350ea059a43ade9b14d7d947690c9f58c12f709256a5ac5064f514a4c25607d433cfc32b1ffcc1a9d67b10ffeafecf3917543bf10fff7140a1e93145b7fa959a2c364e6371fbf0ef41d4567a3defcfb6bdef2c8ba4f60be9c5bc79229d719dffae38a3ecae42d375066ed17176f7632d55e2ce840a5c9b0fefb84791405833c4ec86fa8faa9a47d77b00e90e649c18630c318caf454602d30e33b01fe6096e626ecd75ffdc381b59433be1af0097bb7f1a381cecb4dd1708f1b8ae6dcb38ba527b7736bd2f54619987bde8294d4ec75e6b89a75dd8eb24142f51a3c7863b9c843ed799a4ce3a1a0f7c8e2ad27171f4a3ef12ad363bf69c4bbcc1c6eb801fa5b250c1f408a9b266567ff69c1bbe69a292c7be0b995fd927f0f8c6c22916bff29bebb269b294e7be064eb95c87b605cdbd7feb967a675de42f79e96ab661819ae5774a1ddb6b4db3cf23db1bd790424c83dcafcb5a43ecfab2947b545e0aa8a59a839c14c16ac4c1c45ae52a3596cbfbe8a0dbfb1b3a24eb358435a66936cb1fe37ca16759a651b921df79130ac4d37d42571b7ac634df94e6f2941b8d693967cf4369fb5f1aefc2de5030f6294daec315cf2be9df4df414c32e4d4e991eeabded7c2de59f9538cb07f537fb982e07f989160b7b66b96756ec8222a366f49a3a28a14a0b9c50c79b0a55e24cc5f209741310f2767cfbdb3581dbfbe9863ef86dca72c4e19741987f3a016ede24e4093fc2ca7b9aef3f83ecefe72c9105d00357de802be273fa77ee0957a5f6b62420608ee5d88d82d1f4bc663b8cbd712e92e221d8184f94aa7e81187710060f49eccd0335e4737a0df27bc44eeeb2afc6702691f88bad9c7973e5a2628a40263d51e7e0287bdf0e5c7ff039ab2909391540000	6.1.1-30610
\.


--
-- TOC entry 1961 (class 2606 OID 32794)
-- Name: ActividadesAmigos_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ActividadesAmigos"
    ADD CONSTRAINT "ActividadesAmigos_pkey" PRIMARY KEY ("ActividadID", "AmigoID");


--
-- TOC entry 1957 (class 2606 OID 32772)
-- Name: Actividades_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Actividades"
    ADD CONSTRAINT "Actividades_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 1964 (class 2606 OID 32815)
-- Name: Amigos_pkey; Type: CONSTRAINT; Schema: dbo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Amigos"
    ADD CONSTRAINT "Amigos_pkey" PRIMARY KEY ("Id", "Idamigo");


--
-- TOC entry 1940 (class 2606 OID 24584)
-- Name: PK_dbo.AspNetRoles; Type: CONSTRAINT; Schema: dbo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "AspNetRoles"
    ADD CONSTRAINT "PK_dbo.AspNetRoles" PRIMARY KEY ("Id");


--
-- TOC entry 1950 (class 2606 OID 24618)
-- Name: PK_dbo.AspNetUserClaims; Type: CONSTRAINT; Schema: dbo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "AspNetUserClaims"
    ADD CONSTRAINT "PK_dbo.AspNetUserClaims" PRIMARY KEY ("Id");


--
-- TOC entry 1953 (class 2606 OID 24626)
-- Name: PK_dbo.AspNetUserLogins; Type: CONSTRAINT; Schema: dbo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "AspNetUserLogins"
    ADD CONSTRAINT "PK_dbo.AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey", "UserId");


--
-- TOC entry 1944 (class 2606 OID 24591)
-- Name: PK_dbo.AspNetUserRoles; Type: CONSTRAINT; Schema: dbo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "AspNetUserRoles"
    ADD CONSTRAINT "PK_dbo.AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- TOC entry 1947 (class 2606 OID 24606)
-- Name: PK_dbo.AspNetUsers; Type: CONSTRAINT; Schema: dbo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "AspNetUsers"
    ADD CONSTRAINT "PK_dbo.AspNetUsers" PRIMARY KEY ("Id");


--
-- TOC entry 1955 (class 2606 OID 24664)
-- Name: PK_dbo.__MigrationHistory; Type: CONSTRAINT; Schema: dbo; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "__MigrationHistory"
    ADD CONSTRAINT "PK_dbo.__MigrationHistory" PRIMARY KEY ("MigrationId", "ContextKey");


--
-- TOC entry 1938 (class 1259 OID 24627)
-- Name: AspNetRoles_RoleNameIndex; Type: INDEX; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "AspNetRoles_RoleNameIndex" ON "AspNetRoles" USING btree ("Name");


--
-- TOC entry 1948 (class 1259 OID 24631)
-- Name: AspNetUserClaims_IX_UserId; Type: INDEX; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE INDEX "AspNetUserClaims_IX_UserId" ON "AspNetUserClaims" USING btree ("UserId");


--
-- TOC entry 1951 (class 1259 OID 24632)
-- Name: AspNetUserLogins_IX_UserId; Type: INDEX; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE INDEX "AspNetUserLogins_IX_UserId" ON "AspNetUserLogins" USING btree ("UserId");


--
-- TOC entry 1941 (class 1259 OID 24629)
-- Name: AspNetUserRoles_IX_RoleId; Type: INDEX; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE INDEX "AspNetUserRoles_IX_RoleId" ON "AspNetUserRoles" USING btree ("RoleId");


--
-- TOC entry 1942 (class 1259 OID 24628)
-- Name: AspNetUserRoles_IX_UserId; Type: INDEX; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE INDEX "AspNetUserRoles_IX_UserId" ON "AspNetUserRoles" USING btree ("UserId");


--
-- TOC entry 1945 (class 1259 OID 24630)
-- Name: AspNetUsers_UserNameIndex; Type: INDEX; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "AspNetUsers_UserNameIndex" ON "AspNetUsers" USING btree ("UserName");


--
-- TOC entry 1965 (class 1259 OID 32821)
-- Name: FKI_Idusuario; Type: INDEX; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE INDEX "FKI_Idusuario" ON "Amigos" USING btree ("Idusuario");


--
-- TOC entry 1958 (class 1259 OID 32787)
-- Name: FKI_UsuarioID_AspNetUsers_Id; Type: INDEX; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE INDEX "FKI_UsuarioID_AspNetUsers_Id" ON "Actividades" USING btree ("UsuarioID");


--
-- TOC entry 1959 (class 1259 OID 32781)
-- Name: FKI_UsuarioID_Id; Type: INDEX; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE INDEX "FKI_UsuarioID_Id" ON "Actividades" USING btree ("UsuarioID");


--
-- TOC entry 1962 (class 1259 OID 32810)
-- Name: fki_AspNetUsers_Id; Type: INDEX; Schema: dbo; Owner: postgres; Tablespace: 
--

CREATE INDEX "fki_AspNetUsers_Id" ON "ActividadesAmigos" USING btree ("AmigoID");


--
-- TOC entry 1971 (class 2606 OID 32800)
-- Name: ActividadesAmigos_ActividadID_fkey; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY "ActividadesAmigos"
    ADD CONSTRAINT "ActividadesAmigos_ActividadID_fkey" FOREIGN KEY ("ActividadID") REFERENCES "Actividades"("Id") ON DELETE CASCADE;


--
-- TOC entry 1973 (class 2606 OID 32816)
-- Name: FK_Idusuario; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY "Amigos"
    ADD CONSTRAINT "FK_Idusuario" FOREIGN KEY ("Idusuario") REFERENCES "AspNetUsers"("Id");


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 1973
-- Name: CONSTRAINT "FK_Idusuario" ON "Amigos"; Type: COMMENT; Schema: dbo; Owner: postgres
--

COMMENT ON CONSTRAINT "FK_Idusuario" ON "Amigos" IS 'clave externa ';


--
-- TOC entry 1970 (class 2606 OID 32782)
-- Name: FK_UsuarioID_AspNetUsers_Id; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY "Actividades"
    ADD CONSTRAINT "FK_UsuarioID_AspNetUsers_Id" FOREIGN KEY ("UsuarioID") REFERENCES "AspNetUsers"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1968 (class 2606 OID 24643)
-- Name: FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserClaims"
    ADD CONSTRAINT "FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 1969 (class 2606 OID 24648)
-- Name: FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserLogins"
    ADD CONSTRAINT "FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 1966 (class 2606 OID 24633)
-- Name: FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserRoles"
    ADD CONSTRAINT "FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE;


--
-- TOC entry 1967 (class 2606 OID 24638)
-- Name: FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserRoles"
    ADD CONSTRAINT "FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 1972 (class 2606 OID 32805)
-- Name: fk_AspNetUsers_Id; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY "ActividadesAmigos"
    ADD CONSTRAINT "fk_AspNetUsers_Id" FOREIGN KEY ("AmigoID") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- TOC entry 2098 (class 0 OID 0)
-- Dependencies: 7
-- Name: dbo; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA dbo FROM PUBLIC;
REVOKE ALL ON SCHEMA dbo FROM postgres;
GRANT USAGE ON SCHEMA dbo TO postgres;


--
-- TOC entry 2100 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 180
-- Name: Actividades; Type: ACL; Schema: dbo; Owner: postgres
--

REVOKE ALL ON TABLE "Actividades" FROM PUBLIC;
REVOKE ALL ON TABLE "Actividades" FROM postgres;
GRANT ALL ON TABLE "Actividades" TO postgres;
GRANT ALL ON TABLE "Actividades" TO PUBLIC;


--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 181
-- Name: ActividadesAmigos; Type: ACL; Schema: dbo; Owner: postgres
--

REVOKE ALL ON TABLE "ActividadesAmigos" FROM PUBLIC;
REVOKE ALL ON TABLE "ActividadesAmigos" FROM postgres;
GRANT ALL ON TABLE "ActividadesAmigos" TO postgres;
GRANT ALL ON TABLE "ActividadesAmigos" TO PUBLIC;


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 182
-- Name: Amigos; Type: ACL; Schema: dbo; Owner: postgres
--

REVOKE ALL ON TABLE "Amigos" FROM PUBLIC;
REVOKE ALL ON TABLE "Amigos" FROM postgres;
GRANT ALL ON TABLE "Amigos" TO postgres;
GRANT ALL ON TABLE "Amigos" TO PUBLIC;


--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 173
-- Name: AspNetRoles; Type: ACL; Schema: dbo; Owner: postgres
--

REVOKE ALL ON TABLE "AspNetRoles" FROM PUBLIC;
REVOKE ALL ON TABLE "AspNetRoles" FROM postgres;
GRANT ALL ON TABLE "AspNetRoles" TO postgres;
GRANT ALL ON TABLE "AspNetRoles" TO PUBLIC;


--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 177
-- Name: AspNetUserClaims; Type: ACL; Schema: dbo; Owner: postgres
--

REVOKE ALL ON TABLE "AspNetUserClaims" FROM PUBLIC;
REVOKE ALL ON TABLE "AspNetUserClaims" FROM postgres;
GRANT ALL ON TABLE "AspNetUserClaims" TO postgres;
GRANT ALL ON TABLE "AspNetUserClaims" TO PUBLIC;


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 176
-- Name: AspNetUserClaims_Id_seq; Type: ACL; Schema: dbo; Owner: postgres
--

REVOKE ALL ON SEQUENCE "AspNetUserClaims_Id_seq" FROM PUBLIC;
REVOKE ALL ON SEQUENCE "AspNetUserClaims_Id_seq" FROM postgres;
GRANT ALL ON SEQUENCE "AspNetUserClaims_Id_seq" TO postgres;
GRANT ALL ON SEQUENCE "AspNetUserClaims_Id_seq" TO PUBLIC;


--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 178
-- Name: AspNetUserLogins; Type: ACL; Schema: dbo; Owner: postgres
--

REVOKE ALL ON TABLE "AspNetUserLogins" FROM PUBLIC;
REVOKE ALL ON TABLE "AspNetUserLogins" FROM postgres;
GRANT ALL ON TABLE "AspNetUserLogins" TO postgres;
GRANT ALL ON TABLE "AspNetUserLogins" TO PUBLIC;


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 174
-- Name: AspNetUserRoles; Type: ACL; Schema: dbo; Owner: postgres
--

REVOKE ALL ON TABLE "AspNetUserRoles" FROM PUBLIC;
REVOKE ALL ON TABLE "AspNetUserRoles" FROM postgres;
GRANT ALL ON TABLE "AspNetUserRoles" TO postgres;
GRANT ALL ON TABLE "AspNetUserRoles" TO PUBLIC;


--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 175
-- Name: AspNetUsers; Type: ACL; Schema: dbo; Owner: postgres
--

REVOKE ALL ON TABLE "AspNetUsers" FROM PUBLIC;
REVOKE ALL ON TABLE "AspNetUsers" FROM postgres;
GRANT ALL ON TABLE "AspNetUsers" TO postgres;
GRANT ALL ON TABLE "AspNetUsers" TO PUBLIC;


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 179
-- Name: __MigrationHistory; Type: ACL; Schema: dbo; Owner: postgres
--

REVOKE ALL ON TABLE "__MigrationHistory" FROM PUBLIC;
REVOKE ALL ON TABLE "__MigrationHistory" FROM postgres;
GRANT ALL ON TABLE "__MigrationHistory" TO postgres;
GRANT ALL ON TABLE "__MigrationHistory" TO PUBLIC;


-- Completed on 2015-04-10 14:42:36

--
-- PostgreSQL database dump complete
--

