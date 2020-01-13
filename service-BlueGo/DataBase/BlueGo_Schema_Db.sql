CREATE DATABASE db_blueGo; 

USE db_blueGo;

/*======================================================Create tables============================================================*/
CREATE TABLE `TBSTATES` (
  `fiId`                INT (11) NOT NULL,
  `fcCode`         VARCHAR (2)  NOT NULL COMMENT 'CVE_ENT - Clave de la entidad',
  `fcName`          VARCHAR (40) NOT NULL COMMENT 'NOM_ENT - Nombre de la entidad',
  `fcShortName`     VARCHAR (10) NOT NULL COMMENT 'NOM_ABR - Nombre abreviado de la entidad',
  `fiActive`        tinyint (1)  NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Estados de la República Mexicana';

CREATE TABLE `TBLOCALITIES` (
  `fiId`                   INT (11)   NOT NULL,
  `fiMunicipalityId`       INT (11)   NOT NULL COMMENT 'Relación: municipios -> id',
  `fcCode`             VARCHAR (4)    NOT NULL COMMENT 'CVE_LOC – Clave de la localidad',
  `fcName`             VARCHAR (100)  NOT NULL COMMENT 'NOM_LOC – Nombre de la localidad',
  `fcLatitude`         VARCHAR (15)   NOT NULL COMMENT 'LATITUD – Latitud (en DMS)',
  `fcLongitude`        VARCHAR (15)   NOT NULL COMMENT 'LONGITUD – Longitud (en DMS)',
  `fcAltitude`         VARCHAR (15)   NOT NULL COMMENT 'ALTITUD – Altitud',
  `fcDocument`         VARCHAR (10)   NOT NULL COMMENT 'CVE_CARTA',
  `fcAmbit`            VARCHAR (1)    NOT NULL COMMENT 'AMBITO',
  `fiPopulation`           INT (11)   NOT NULL COMMENT 'PTOT – Población Total',
  `fiMale`                 INT (11)   NOT NULL COMMENT 'PMAS – Población Masculina',
  `fIFemale`               INT (11)   NOT NULL COMMENT 'PFEM – Población Femenina',
  `fiApartments`           INT (11)   NOT NULL COMMENT 'VTOT – Número total de viviendas',
  `fiDecimalLat`       DECIMAL (10,7) NOT NULL COMMENT 'Latitud en decimal',
  `fiDecimalLong`      DECIMAL (10,7) NOT NULL COMMENT 'Longitud en decimal',
  `fiActive`           tinyint (1)    NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Localidades de la República Mexicana';

CREATE TABLE `TBMUNICIPALITY` (
  `fiId`               INT (11)  NOT NULL,
  `fiStateId`          INT (11)  NOT NULL COMMENT 'Relación: estados -> id',
  `fcCode`         VARCHAR (3)   NOT NULL COMMENT 'CVE_MUN – Clave del municipio',
  `fcName`         VARCHAR (100) NOT NULL COMMENT 'NOM_MUN – Nombre del municipio',
  `fiActive`       tinyint (1)   NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Municipios de la República Mexicana';

/**/
--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estados`
--
ALTER TABLE `TBSTATES`
  ADD PRIMARY KEY (`fiId`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `TBLOCALITIES`
  ADD PRIMARY KEY (`fiId`),
  ADD KEY `municipaly_id` (`fiMunicipalityId`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `TBMUNICIPALITY`
  ADD PRIMARY KEY (`fiId`),
  ADD KEY `state_id` (`fiStateId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `TBSTATES`
  MODIFY `fiId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `TBLOCALITIES`
  MODIFY `fiId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304496;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `TBMUNICIPALITY`
  MODIFY `fiId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2464;
COMMIT;
-- End

CREATE TABLE TBDIRECTIONS(
fiId                          INT NOT NULL,
fcStreet          VARCHAR(50) NOT NULL,
fiStreetNumber                INT NOT NULL,
fiPostalCode                  INT NOT NULL,
fiIdLocality                  INT NOT NULL,
fiStatus                      INT NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Direcciones para las rutas';

ALTER TABLE `TBDIRECTIONS`
  ADD PRIMARY KEY (`fiId`),
  ADD KEY `locality_id` (`fiIdLocality`);

ALTER TABLE `TBDIRECTIONS`
  MODIFY `fiId` int(11) NOT NULL AUTO_INCREMENT;  
  
CREATE TABLE TBCAMPUS(
fiId                 INT NOT NULL,
fcName       VARCHAR(60) NOT NULL,
fiIdDirection        INT NOT NULL,  
fiStatus             INT  NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Campus relacionados con el sercio';

ALTER TABLE `TBCAMPUS`
  ADD PRIMARY KEY (`fiId`),
  ADD KEY `direction_id` (`fiIdDirection`);

ALTER TABLE `TBCAMPUS`
  MODIFY `fiId` int(11) NOT NULL AUTO_INCREMENT;  

CREATE TABLE TBACADEMICGRADE(
fiId                 INT NOT NULL,
fcName       VARCHAR(60) NOT NULL,  
fiStatus             INT  NOT NULL  
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Grados académicos de los usuarios';

ALTER TABLE `TBACADEMICGRADE`
  ADD PRIMARY KEY (`fiId`);

ALTER TABLE `TBACADEMICGRADE`
  MODIFY `fiId` int(11) NOT NULL AUTO_INCREMENT;   

CREATE TABLE TBPROFILES(
fiId                 INT NOT NULL,
fcName       VARCHAR(60) NOT NULL,  
fiStatus             INT  NOT NULL 
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Perfiles asignanos para los usuarios';

ALTER TABLE `TBPROFILES`
  ADD PRIMARY KEY (`fiId`);

ALTER TABLE `TBPROFILES`
  MODIFY `fiId` int(11) NOT NULL AUTO_INCREMENT;   

CREATE TABLE TBUSERS(
fiMatricule                 INT  NOT NULL,
fcName              VARCHAR(60)  NOT NULL, 
fcSecondName        VARCHAR(40)  NOT NULL,
fcLastName          VARCHAR(40)  NOT NULL,
fiIdCollege                 INT  NOT NULL,
fiIdAcademicGrade           INT  NOT NULL,
fcMail              VARCHAR(50)  NOT NULL,
fiCellNumber        VARCHAR(40)  NOT NULL,
fcImageRoute        VARCHAR(500)         ,
fiIdContractPeriod          INT  NOT NULL,
fiIdRoute                   INT  NOT NULL,
fiIdProfile                 INT  NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Usuarios registrados al servicio';

ALTER TABLE `TBUSERS`
  ADD KEY `college_id` (`fiIdCollege`),
  ADD KEY `grade_id` (`fiIdAcademicGrade`),
  ADD KEY `contractPeriod_id` (`fiIdContractPeriod`),
  ADD KEY `route_id` (`fiIdRoute`),
  ADD KEY `profile_id` (`fiIdProfile`);

CREATE TABLE TBSERVICEPERIOD(
fiId                 INT NOT NULL,
fcName       VARCHAR(60) NOT NULL,  
fiStatus             INT  NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Periodos en los que se imparte el servicio';

ALTER TABLE `TBSERVICEPERIOD`
  ADD PRIMARY KEY (`fiId`);

ALTER TABLE `TBSERVICEPERIOD`
  MODIFY `fiId` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE TBROUTES(
fiId                       INT                    NOT NULL,
fcName          varchar(10000)                    NOT NULL,
fiIdDirection              INT                    NOT NULL,
fiStatus                   INT                    NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Rutas que brinda el servicio';

ALTER TABLE `TBROUTES`
  ADD PRIMARY KEY (`fiId`),
   ADD KEY `direction_id` (`fiIdDirection`);

ALTER TABLE `TBROUTES`
  MODIFY `fiId` int(11) NOT NULL AUTO_INCREMENT;


CREATE TABLE TBHOURSTYPE(
fiId               INT NOT NULL,
fcTypeName VARCHAR(60) NOT NULL,
fiStatus           INT NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Descripción tipos de horarios';  

ALTER TABLE `TBHOURSTYPE`
  ADD PRIMARY KEY (`fiId`);

ALTER TABLE `TBHOURSTYPE`
  MODIFY `fiId` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE TBROUTESHOURS(
fiId             INT NOT NULL,
fiIdType 		 INT NOT NULL,
fcHour   VARCHAR(50) NOT NULL,
fiStatus 		 INT NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Horarios de las rutas';  

ALTER TABLE `TBROUTESHOURS`
  ADD PRIMARY KEY (`fiId`),
   ADD KEY `hourType_id` (`fiIdType`);
   
ALTER TABLE `TBROUTESHOURS`
  MODIFY `fiId` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE TBROUTESDETAILS(
fiIdRoute  INT NOT NULL,
fiIdHour   INT NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Detalle de las rutas';

ALTER TABLE `TBROUTESDETAILS`
   ADD KEY `route_id` (`fiIdRoute`),
   ADD KEY `hour_id` (`fiIdHour`); 
   
CREATE TABLE db_blueGo.TBUSERROUTES(
fiId                           INT NOT NULL,
fiMatricule           VARCHAR (10) NOT NULL,
fcName                VARCHAR (50) NOT NULL,
fcSecondName          VARCHAR (50) NOT NULL,
fcLastName            VARCHAR (50) NOT NULL,
fcMail                VARCHAR (50) NOT NULL,
fiCellNumber          VARCHAR (10) NOT NULL,
fiIdRoute             		  INT  NOT NULL,
fiIdContgractPeriod   		  INT  NOT NULL,
fiIdAcademicGrade     		  INT  NOT NULL,
fiIdCollege           		  INT  NOT NULL,
fiIdOutHour           		  INT  NOT NULL,
fiIdReturnHour        		  INT  NOT NULL,
fiStatus                      INT  NOT NULL
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tabla usuarios y rutas';   

ALTER TABLE `TBUSERROUTES`
  ADD PRIMARY KEY (`fiId`),
  ADD KEY `route_id` (`fiIdRoute`),
  ADD KEY `contractP_id` (`fiIdContgractPeriod`),
  ADD KEY `academicG_id` (`fiIdAcademicGrade`),
  ADD KEY `college_id` (`fiIdCollege`),
  ADD KEY `outHour_id` (`fiIdOutHour`),
  ADD KEY `returnHour_id` (`fiIdReturnHour`);
   
ALTER TABLE `TBUSERROUTES`
  MODIFY `fiId` int(11) NOT NULL AUTO_INCREMENT;
/*======================================================Create store procedures============================================================*/

DELIMITER $$
CREATE PROCEDURE db_blueGo.SPWEBSELECTREGISTERUSERINFO ()
BEGIN

DECLARE CSIONE   INT DEFAULT 1;
--  ============================================ Routes Object ==============================================================================
SELECT route.fiId,
       route.fcName,
       concat(dir.fcStreet,' ', dir.fiStreetNumber,' ','CP. ',dir.fiPostalCode,' ',
              loc.fcName,' ',mun.fcName) AS fcAddress
	   FROM db_blueGo.TBROUTES route
       INNER JOIN db_blueGo.TBDIRECTIONS dir
       ON dir.fiId = route.fiIdDirection
       INNER JOIN db_blueGo.TBLOCALITIES loc
       ON dir.fiIdLocality = loc.fiId
       INNER JOIN db_blueGo.TBMUNICIPALITY mun
       ON loc.fiMunicipalityId = mun.fiId
       WHERE route.fiStatus = CSIONE;
-- =============================================     END     ===============================================================================

-- ============================================= Academic Grades Object ====================================================================

SELECT fiId,
       fcName 
       FROM db_blueGo.TBACADEMICGRADE
       WHERE fiStatus = CSIONE;

-- ===================================================== End ===============================================================================

-- ============================================= Academic Campus Object=====================================================================
SELECT 
       fiId, 
       fcName
       FROM db_blueGo.TBCAMPUS
       WHERE fiStatus = CSIONE;
/*SELECT cmp.fiId,
       concat(cmp.fcName,' ',loc.fcName,' ',st.fcName) as fcCampusName 
       FROM db_blueGo.TBCAMPUS cmp
       INNER JOIN db_bluego.tbdirections dir
       ON cmp.fiIdDirection = dir.fiId
       INNER JOIN db_blueGo.TBMUNICIPALITY loc
       ON dir.fiIdLocality = loc.fiId
       INNER JOIN db_blueGo.TBSTATES st
       ON loc.fiStateId = st.fiId
       WHERE cmp.fiStatus = CSIONE;*/

-- ===================================================== End ===============================================================================

-- ============================================= Service Periods Object ====================================================================

SELECT fiId,
       fcName 
       FROM db_blueGo.TBSERVICEPERIOD
       WHERE fiStatus = CSIONE;

-- ===================================================== End ===============================================================================

-- ============================================= Profiles Object ===========================================================================

SELECT fiId,
       fcName 
       FROM db_blueGo.TBPROFILES
       WHERE fiStatus = CSIONE;

-- ===================================================== End ===============================================================================


-- ================================================ Times Object ===========================================================================
SELECT 
	   hr.fiId,
       tphr.fcTypeName,
       hr.fcHour,
       hr.fiStatus 
       FROM db_bluego.TBROUTESHOURS hr
       INNER JOIN db_bluego.tbhourstype tphr
       ON hr.fiIdType = tphr.fiId
       AND hr.fiStatus = CSIONE;


-- ===================================================== End ===============================================================================
-- ===================================================== Routes & hours details object =====================================================

SELECT 
	   fiIdRoute,
       fiIdHour  
       FROM db_bluego.TBROUTESDETAILS;

-- ========================================================  END  ==========================================================================
END $$
DELIMITER ;

CALL db_bluego.SPWEBSELECTREGISTERUSERINFO();
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

DELIMITER $$
CREATE PROCEDURE db_blueGo.SPWEBREGISTERUSERROUTE(IN fiMatriculeIN VARCHAR(10), IN fcNameIN VARCHAR(50), IN fcSecondNameIN VARCHAR(50), IN fcLastNameIN VARCHAR(50)
									  , IN fcMailIN VARCHAR(50), IN fiCellNumberIN VARCHAR(10), IN fiIdRouteIN INT, IN fiIdContgractPeriodIN INT, IN fiIdAcademicGradeIN INT
                                      , IN fiIdCollegeIN INT, IN fiIdOutHourIN INT, IN fiIdReturnHourIN INT)
BEGIN
	  DECLARE   CSIONE              BIT     DEFAULT                  1;
	  DECLARE   CSISUCCESSRESPONSE  boolean DEFAULT               true;
	  DECLARE   CSIERRORRESPONSE    boolean DEFAULT              false;

DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN
      
      /*SELECT CSIERRORRESPONSE AS RESPONSE;*/
           -- Declare variables to hold diagnostics area information
    DECLARE errcount INT;
    DECLARE errno INT;
    DECLARE msg TEXT;
    DECLARE csiuno int default 1;
    GET CURRENT DIAGNOSTICS CONDITION csiuno
      errno = MYSQL_ERRNO, msg = MESSAGE_TEXT;
    SELECT 'current DA before mapped insert' AS op, errno, msg;
    GET STACKED DIAGNOSTICS CONDITION csiuno
      errno = MYSQL_ERRNO, msg = MESSAGE_TEXT;
    SELECT 'stacked DA before mapped insert' AS op, errno, msg;
END;

START TRANSACTION;

INSERT INTO db_bluego.TBUSERROUTES (fiMatricule,fcName,fcSecondName,fcLastName,fcMail,fiCellNumber
                                  ,fiIdRoute,fiIdContgractPeriod,fiIdAcademicGrade,fiIdCollege,fiIdOutHour,fiIdReturnHour,fiStatus)
							VALUES(UPPER(fiMatriculeIN),UPPER(fcNameIN),UPPER(fcSecondNameIN)       
                                  ,UPPER(fcLastNameIN),fcMailIN,fiCellNumberIN,fiIdRouteIN          
                                  ,fiIdContgractPeriodIN,fiIdAcademicGradeIN,fiIdCollegeIN,fiIdOutHourIN,fiIdReturnHourIN, CSIONE);
COMMIT;
      SELECT  CSISUCCESSRESPONSE AS RESPONSE;

END $$
DELIMITER ;

SELECT * FROM db_bluego.TBUSERROUTES;

/*======================================================Scripts insert data================================================================*/
INSERT INTO `TBSTATES` (`fiId`, `fcCode`, `fcName`, `fcShortName`, `fiActive`) VALUES
(1, '01', 'Aguascalientes', 'Ags.', 1),
(2, '02', 'Baja California', 'BC', 1),
(3, '03', 'Baja California Sur', 'BCS', 1),
(4, '04', 'Campeche', 'Camp.', 1),
(5, '05', 'Coahuila de Zaragoza', 'Coah.', 1),
(6, '06', 'Colima', 'Col.', 1),
(7, '07', 'Chiapas', 'Chis.', 1),
(8, '08', 'Chihuahua', 'Chih.', 1),
(9, '09', 'Ciudad de México', 'CDMX', 1),
(10, '10', 'Durango', 'Dgo.', 1),
(11, '11', 'Guanajuato', 'Gto.', 1),
(12, '12', 'Guerrero', 'Gro.', 1),
(13, '13', 'Hidalgo', 'Hgo.', 1),
(14, '14', 'Jalisco', 'Jal.', 1),
(15, '15', 'México', 'Mex.', 1),
(16, '16', 'Michoacán de Ocampo', 'Mich.', 1),
(17, '17', 'Morelos', 'Mor.', 1),
(18, '18', 'Nayarit', 'Nay.', 1),
(19, '19', 'Nuevo León', 'NL', 1),
(20, '20', 'Oaxaca', 'Oax.', 1),
(21, '21', 'Puebla', 'Pue.', 1),
(22, '22', 'Querétaro', 'Qro.', 1),
(23, '23', 'Quintana Roo', 'Q. Roo', 1),
(24, '24', 'San Luis Potosí', 'SLP', 1),
(25, '25', 'Sinaloa', 'Sin.', 1),
(26, '26', 'Sonora', 'Son.', 1),
(27, '27', 'Tabasco', 'Tab.', 1),
(28, '28', 'Tamaulipas', 'Tamps.', 1),
(29, '29', 'Tlaxcala', 'Tlax.', 1),
(30, '30', 'Veracruz de Ignacio de la Llave', 'Ver.', 1),
(31, '31', 'Yucatán', 'Yuc.', 1),
(32, '32', 'Zacatecas', 'Zac.', 1);

/*================================================================================================================================================================*/
-- 1
INSERT INTO db_blueGo.TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Del Rancho, Cofradia de San Miguel',0,54715,144263,1);
            
INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('COFRADIA, CASA DE CULTURA',1,1);    

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(1,3),
				  (1,15),
                  (1,23),
                  (1,24);
-- 2 
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Av de los Chopos, Arcos del Alba',194,54750,144263,1);

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('CUAUTITLAN, RICO TACO',2,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(2,6),
				  (2,17),
                  (2,23),
                  (2,24);            
-- 3
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Ex- Hda. San Mateo Tecoloapan',0,52959,140025,1);

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('SAN MATEO (CLUB DE GOLF EN EL TOPE, Club de Golf Hacienda)',3,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(3,2),
				  (3,19),
                  (3,23),
                  (3,24);                        
-- 4
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Avenida Lomas Verdes, Boulevares',0,53140,141389,1);            

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('LOMAS VERDES (GRAN TERRAZA)',4,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(4,3),
				  (4,21),
                  (4,23),
                  (4,24);
-- 5            
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Calz. de los Jinetes 1, Las Arboledas',0,54026,143259,1);

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('VALLE DORADO (FISHERS)',5,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(5,9),
				  (5,20),
                  (5,23),
                  (5,24);            
-- 6            
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Blvd. Manuel Ávila Camacho, Cd. Satélite',2150,54026,141389,1);

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('SATELITE (HOOTERS)Perif.',6,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(6,5),
				  (6,22),
                  (6,23),
                  (6,24);                        
-- 7            
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Hacienda de Sierra Vieja 2, Hacienda del Parque',0,54769,144263,1);

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('PERINORTE (SANBORNS)',7,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(7,8),
				  (7,14),
                  (7,23),
                  (7,24);                        
-- 8            
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Av José López Portillo',0,54916,143619,1);

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('ASTA BANDERA TULTITLAN',8,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(8,6),
				  (8,13),
                  (8,23),
                  (8,24);                        
-- 9            
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Av José López Portillo, San Lorenzo Tetlixtac',220,55714,140279,1);

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('COACALCO (PLAZA COACALCO)',9,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(9,2),
				  (9,11),
                  (9,23),
                  (9,24);                        
-- 10            
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Av. Paseo de la Reforma, Juárez',222,06600,66002,1);            

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('REFORMA 222',10,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(10,4),
				  (10,15),
                  (10,23),
                  (10,24);                                    
-- 11
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Lomas de Sotelo, Militar',0,11200,83093,1);

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('LOMAS DE SOTELO (CINE)Plaza Sedena',11,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(11,7),
				  (11,17),
                  (11,23),
                  (11,24);                                                
-- 12
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('PUERTA 7 Campo Militar 1 A',0,53538,141389,1);            

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('PUERTA 7 Campo Militar 1 A',12,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(12,6),
				  (12,16),
                  (12,23),
                  (12,24);            
-- 13
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Av. Cuitláhuac, Jardín Azpeitia',3354,02530,82433,1);            

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('AZCAPOTZALCO (COPPEL CAMARONES)',13,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(13,3),
				  (13,15),
                  (13,23),
                  (13,24);                              
-- 14
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Av. Cuitláhuac, Jardín Azpeitia',3354,02530,82433,1);

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('TLANEPANTLA (CHEVROLET)',14,1);            

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(14,7),
				  (14,19),
                  (14,23),
                  (14,24);                        
-- 15
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Av. Pirámides, Centro',0,55810,142825,1);

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('TEOTIHUACAN GRUPO MODELO',15,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(15,3),
				  (15,10),
                  (15,23),
                  (15,24);            
-- 16
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Av. Revolución, Hogares Marla',208, 55030,140583,1);

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('ECATEPEC FORD',16,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(16,1),
				  (16,12),
                  (16,23),
                  (16,24);            
-- 17
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Av. Carlos Hank González, Rinconada de Aragon',120, 55030,140583,1);

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('PLAZA ARAGON',17,1);            

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(17,3),
				  (17,18),
                  (17,23),
                  (17,24);            
-- 18
INSERT INTO TBDIRECTIONS (fcStreet, fiStreetNumber, fiPostalCode, fiIdLocality, fiStatus) 
            VALUES('Nueva Industrial Vallejo',343, 07700,82458,1);            

INSERT INTO db_blueGo.TBROUTES (fcName, fiIdDirection, fiStatus)
            VALUES('LINDAVISTA Miguel Othón de Mendizabal Ote.',18,1);

INSERT INTO db_blueGo.TBROUTESDETAILS (fiIdRoute,fiIdHour)
            VALUES(18,6),
				  (18,16),
                  (18,23),
                  (18,24);            

select * from  db_bluego.TBLOCALITIES where  fiMunicipalityId = 271 order by 4 asc;

SELECT * FROM db_bluego.TBMUNICIPALITY WHERE fcName like '%Azcapot%';            
-- =======================================================================================================================================================================
INSERT INTO db_bluego.TBSERVICEPERIOD(fcName,fiStatus)
			VALUES('INVIERNO', 1),
			      ('VERANO', 1);
-- =======================================================================================================================================================================
INSERT INTO db_bluego.TBHOURSTYPE(fcTypeName,fiStatus)
            VALUES('SALIDA',1),
			      ('REGRESO',1);
-- =======================================================================================================================================================================
INSERT INTO db_bluego.TBROUTESHOURS(fiIdType,fcHour,fiStatus)
            VALUES
                  -- ======================= SALIDAS
                  -- 1
                  (1,'5:00:00 AM',1),
                  -- 2
                  (1,'5:10:00 AM',1),
                  -- 3
                  (1,'5:20:00 AM',1),
                  -- 4
                  (1,'5:30:00 AM',1),
                  -- 5
                  (1,'5:35:00 AM',1),
                  -- 6
				  (1,'5:40:00 AM',1),
                  -- 7
				  (1,'5:45:00 AM',1), 
                  -- 8
				  (1,'6:05:00 AM',1),
                  -- 9
                  (1,'6:20:00 AM',1),
                  -- 10
                  (1,'10:00:00 AM',1),
                  -- 11
                  (1,'10:25:00 AM',1),
                  -- 12
                  (1,'10:30:00 AM',1),
                  -- 13
                  (1,'10:40:00 AM',1),
                  -- 14
                  (1,'10:55:00 AM',1),
                  -- 15
                  (1,'11:00:00 AM',1),
                  -- 16
                  (1,'11:15:00 AM',1),
                  -- 17
                  (1,'11:20:00 AM',1),
                  -- 18
                  (1,'11:25:00 AM',1),
                  -- 19
                  (1,'11:30:00 AM',1),
                  -- 20
                  (1,'11:40:00 AM',1),
                  -- 21
                  (1,'12:00:00 PM',1),
                  -- 22
                  (1,'12:15:00 PM',1),
                  -- ==================== TERMINÓ SALIDAS
                  -- ==================== REGRESOS 
                  -- 23
                  (2,'2:30:00 PM',1),
                  -- 24
                  (2,'5:00:00 PM',1);
                  -- ==================== FIN REGRESOS 
-- ===================================================================================================================================================================
INSERT INTO db_bluego.tbcampus (fcName,fiIdDirection,fiStatus)
	        VALUES ('Tecnológico de Monterrey Campus Edo. de Mex.',0,1);				
-- ===================================================================================================================================================================
INSERT INTO db_blueGo.TBPROFILES (fcName, fiStatus)
            VALUES('ADMINISTRADOR',1),
                  ('USUARIO RUTAS',1);            
-- ===================================================================================================================================================================
INSERT INTO db_blueGo.TBACADEMICGRADE(fcName, fiStatus)
            VALUES('BACHILLERATO',1),
				  ('LICENCIATURA',1);                  