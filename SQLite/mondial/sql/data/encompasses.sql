
/* encompasses */

DROP TABLE IF EXISTS encompasses
;

CREATE TABLE IF NOT EXISTS encompasses(
	Country VARCHAR2(4) NOT NULL,
	Continent VARCHAR2(20) NOT NULL,
	Percentage NUMBER,
		CHECK ((Percentage > 0) AND (Percentage <= 100)),
	CONSTRAINT EncompassesKey PRIMARY KEY (Country,Continent)
)
;

INSERT INTO encompasses(Country,Continent,Percentage) VALUES 
	('AL','Europe',100),
	('GR','Europe',100),
	('MK','Europe',100),
	('SRB','Europe',100),
	('MNE','Europe',100),
	('KOS','Europe',100),
	('AND','Europe',100),
	('F','Europe',100),
	('E','Europe',100),
	('A','Europe',100),
	('CZ','Europe',100),
	('D','Europe',100),
	('H','Europe',100),
	('I','Europe',100),
	('FL','Europe',100),
	('SK','Europe',100),
	('SLO','Europe',100),
	('CH','Europe',100),
	('BY','Europe',100),
	('LV','Europe',100),
	('LT','Europe',100),
	('PL','Europe',100),
	('UA','Europe',100),
	('R','Europe',25),
	('R','Asia',75),
	('B','Europe',100),
	('L','Europe',100),
	('NL','Europe',100),
	('BIH','Europe',100),
	('HR','Europe',100),
	('BG','Europe',100),
	('RO','Europe',100),
	('TR','Europe',3),
	('TR','Asia',97),
	('DK','Europe',100),
	('EW','Europe',100),
	('FARX','Europe',100),
	('SF','Europe',100),
	('N','Europe',100),
	('S','Europe',100),
	('MC','Europe',100),
	('GBZ','Europe',100),
	('GBG','Europe',100),
	('V','Europe',100),
	('CEU','Africa',100),
	('MEL','Africa',100),
	('IS','Europe',100),
	('IRL','Europe',100),
	('RSM','Europe',100),
	('GBJ','Europe',100),
	('M','Europe',100),
	('GBM','Europe',100),
	('MD','Europe',100),
	('P','Europe',100),
	('SVAX','Europe',100),
	('GB','Europe',100),
	('AFG','Asia',100),
	('CN','Asia',100),
	('IR','Asia',100),
	('PK','Asia',100),
	('TAD','Asia',100),
	('TM','Asia',100),
	('UZB','Asia',100),
	('ARM','Asia',100),
	('GE','Asia',100),
	('AZ','Asia',100),
	('BRN','Asia',100),
	('BD','Asia',100),
	('MYA','Asia',100),
	('IND','Asia',100),
	('BHT','Asia',100),
	('BRU','Asia',100),
	('MAL','Asia',100),
	('LAO','Asia',100),
	('THA','Asia',100),
	('K','Asia',100),
	('VN','Asia',100),
	('KAZ','Europe',5.4),
	('KAZ','Asia',94.6),
	('NOK','Asia',100),
	('KGZ','Asia',100),
	('HONX','Asia',100),
	('MACX','Asia',100),
	('MNG','Asia',100),
	('NEP','Asia',100),
	('XMAS','Australia/Oceania',100),
	('COCO','Australia/Oceania',100),
	('CY','Europe',100),
	('GAZA','Asia',100),
	('IL','Asia',100),
	('ET','Asia',7.3),
	('ET','Africa',92.7),
	('RI','Asia',78),
	('RI','Australia/Oceania',22),
	('TL','Asia',100),
	('PNG','Australia/Oceania',100),
	('IRQ','Asia',100),
	('JOR','Asia',100),
	('KWT','Asia',100),
	('SA','Asia',100),
	('SYR','Asia',100),
	('RL','Asia',100),
	('WEST','Asia',100),
	('J','Asia',100),
	('ROK','Asia',100),
	('MV','Asia',100),
	('OM','Asia',100),
	('UAE','Asia',100),
	('YE','Asia',100),
	('RP','Asia',100),
	('Q','Asia',100),
	('SGP','Asia',100),
	('CL','Asia',100),
	('RC','Asia',100),
	('AXA','America',100),
	('AG','America',100),
	('ARU','America',100),
	('BS','America',100),
	('BDS','America',100),
	('BZ','America',100),
	('GCA','America',100),
	('MEX','America',100),
	('BERM','America',100),
	('BVIR','America',100),
	('CDN','America',100),
	('USA','America',100),
	('CAYM','America',100),
	('CR','America',100),
	('NIC','America',100),
	('PA','America',100),
	('C','America',100),
	('WD','America',100),
	('DOM','America',100),
	('RH','America',100),
	('ES','America',100),
	('HCA','America',100),
	('GROX','America',100),
	('WG','America',100),
	('GUAD','America',100),
	('JA','America',100),
	('MART','America',100),
	('MNTS','America',100),
	('CUR','America',100),
	('NLSM','America',100),
	('SMAR','America',100),
	('SBAR','America',100),
	('CO','America',100),
	('PR','America',100),
	('KN','America',100),
	('WL','America',100),
	('SPMI','America',100),
	('WV','America',100),
	('TT','America',100),
	('TUCA','America',100),
	('VIRG','America',100),
	('AMSA','Australia/Oceania',100),
	('AUS','Australia/Oceania',100),
	('COOK','Australia/Oceania',100),
	('FJI','Australia/Oceania',100),
	('FPOL','Australia/Oceania',100),
	('GUAM','Australia/Oceania',100),
	('KIR','Australia/Oceania',100),
	('MH','Australia/Oceania',100),
	('FSM','Australia/Oceania',100),
	('NAU','Australia/Oceania',100),
	('NCA','Australia/Oceania',100),
	('NZ','Australia/Oceania',100),
	('NIUE','Australia/Oceania',100),
	('NORF','Australia/Oceania',100),
	('NMIS','Australia/Oceania',100),
	('PAL','Australia/Oceania',100),
	('PITC','Australia/Oceania',100),
	('SLB','Australia/Oceania',100),
	('TO','Australia/Oceania',100),
	('TUV','Australia/Oceania',100),
	('TOK','Australia/Oceania',100),
	('VU','Australia/Oceania',100),
	('WAFU','Australia/Oceania',100),
	('WS','Australia/Oceania',100),
	('RA','America',100),
	('BOL','America',100),
	('BR','America',100),
	('RCH','America',100),
	('PY','America',100),
	('ROU','America',100),
	('PE','America',100),
	('FGU','America',100),
	('GUY','America',100),
	('SME','America',100),
	('YV','America',100),
	('EC','America',100),
	('FALK','America',100),
	('DZ','Africa',100),
	('LAR','Africa',100),
	('RMM','Africa',100),
	('RIM','Africa',100),
	('MA','Africa',100),
	('RN','Africa',100),
	('TN','Africa',100),
	('WSA','Africa',100),
	('ANG','Africa',100),
	('RCB','Africa',100),
	('NAM','Africa',100),
	('ZRE','Africa',100),
	('Z','Africa',100),
	('BEN','Africa',100),
	('BF','Africa',100),
	('WAN','Africa',100),
	('RT','Africa',100),
	('RB','Africa',100),
	('RSA','Africa',100),
	('ZW','Africa',100),
	('CI','Africa',100),
	('GH','Africa',100),
	('BI','Africa',100),
	('RWA','Africa',100),
	('EAT','Africa',100),
	('CAM','Africa',100),
	('RCA','Africa',100),
	('TCH','Africa',100),
	('GQ','Africa',100),
	('G','Africa',100),
	('CV','Africa',100),
	('SUD','Africa',100),
	('SSD','Africa',100),
	('COM','Africa',100),
	('RG','Africa',100),
	('LB','Africa',100),
	('DJI','Africa',100),
	('ER','Africa',100),
	('ETH','Africa',100),
	('SP','Africa',100),
	('EAK','Africa',100),
	('WAG','Africa',100),
	('SN','Africa',100),
	('GNB','Africa',100),
	('WAL','Africa',100),
	('EAU','Africa',100),
	('LS','Africa',100),
	('RM','Africa',100),
	('MW','Africa',100),
	('MOC','Africa',100),
	('MS','Africa',100),
	('MAYO','Africa',100),
	('SD','Africa',100),
	('REUN','Africa',100),
	('HELX','Africa',100),
	('STP','Africa',100),
	('SY','Africa',100)
;


