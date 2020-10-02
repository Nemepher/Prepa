
/* islandIn */

DROP TABLE IF EXISTS islandIn
;

CREATE TABLE IF NOT EXISTS islandIn(
	Island VARCHAR2(50),
	Sea VARCHAR2(50),
	Lake VARCHAR2(50),
	River VARCHAR2(50)
)
;

INSERT INTO islandIn(Island,Sea,Lake,River) VALUES 
	('Svalbard','Norwegian Sea',NULL,NULL),
	('Svalbard','Greenland Sea',NULL,NULL),
	('Svalbard','Barents Sea',NULL,NULL),
	('Svalbard','Arctic Ocean',NULL,NULL),
	('Greenland','Atlantic Ocean',NULL,NULL),
	('Greenland','Greenland Sea',NULL,NULL),
	('Greenland','Arctic Ocean',NULL,NULL),
	('Greenland','Labrador Sea',NULL,NULL),
	('Iceland','Atlantic Ocean',NULL,NULL),
	('Iceland','Norwegian Sea',NULL,NULL),
	('Iceland','Greenland Sea',NULL,NULL),
	('Austvågøy','Norwegian Sea',NULL,NULL),
	('Streymoy','Atlantic Ocean',NULL,NULL),
	('Streymoy','Norwegian Sea',NULL,NULL),
	('Ireland','Atlantic Ocean',NULL,NULL),
	('Ireland','Irish Sea',NULL,NULL),
	('Great Britain','Atlantic Ocean',NULL,NULL),
	('Great Britain','The Channel',NULL,NULL),
	('Great Britain','Irish Sea',NULL,NULL),
	('Great Britain','North Sea',NULL,NULL),
	('Shetland Mainland','North Sea',NULL,NULL),
	('Shetland Mainland','Norwegian Sea',NULL,NULL),
	('Orkney Mainland','North Sea',NULL,NULL),
	('South Ronaldsay','North Sea',NULL,NULL),
	('Hoy','North Sea',NULL,NULL),
	('Westray','North Sea',NULL,NULL),
	('Barra','Atlantic Ocean',NULL,NULL),
	('South Uist','Atlantic Ocean',NULL,NULL),
	('Benbecula','Atlantic Ocean',NULL,NULL),
	('North Uist','Atlantic Ocean',NULL,NULL),
	('Lewis and Harris','Atlantic Ocean',NULL,NULL),
	('Skye','Atlantic Ocean',NULL,NULL),
	('Rhum','Atlantic Ocean',NULL,NULL),
	('Mull','Atlantic Ocean',NULL,NULL),
	('Tiree','Atlantic Ocean',NULL,NULL),
	('Islay','Atlantic Ocean',NULL,NULL),
	('Jura','Atlantic Ocean',NULL,NULL),
	('Arran','Atlantic Ocean',NULL,NULL),
	('Isle of Man','Irish Sea',NULL,NULL),
	('Anglesey','Irish Sea',NULL,NULL),
	('Isle of Wight','The Channel',NULL,NULL),
	('Guernsey','The Channel',NULL,NULL),
	('Jersey','The Channel',NULL,NULL),
	('Gotland','Baltic Sea',NULL,NULL),
	('Öland','Baltic Sea',NULL,NULL),
	('Åland','Baltic Sea',NULL,NULL),
	('Hiumaa','Baltic Sea',NULL,NULL),
	('Ösel','Baltic Sea',NULL,NULL),
	('Seeland','Kattegat',NULL,NULL),
	('Seeland','Baltic Sea',NULL,NULL),
	('Fünen','Kattegat',NULL,NULL),
	('Fünen','Baltic Sea',NULL,NULL),
	('Langeland','Baltic Sea',NULL,NULL),
	('Falster','Baltic Sea',NULL,NULL),
	('Lolland','Baltic Sea',NULL,NULL),
	('Bornholm','Baltic Sea',NULL,NULL),
	('Fehmarn','Baltic Sea',NULL,NULL),
	('Rügen','Baltic Sea',NULL,NULL),
	('Usedom','Baltic Sea',NULL,NULL),
	('Helgoland','North Sea',NULL,NULL),
	('Sylt','North Sea',NULL,NULL),
	('Föhr','North Sea',NULL,NULL),
	('Amrum','North Sea',NULL,NULL),
	('Pellworm','North Sea',NULL,NULL),
	('Wangerooge','North Sea',NULL,NULL),
	('Spiekeroog','North Sea',NULL,NULL),
	('Langeoog','North Sea',NULL,NULL),
	('Baltrum','North Sea',NULL,NULL),
	('Norderney','North Sea',NULL,NULL),
	('Juist','North Sea',NULL,NULL),
	('Borkum','North Sea',NULL,NULL),
	('Schiermonnikoog','North Sea',NULL,NULL),
	('Ameland','North Sea',NULL,NULL),
	('Terschelling','North Sea',NULL,NULL),
	('Vlieland','North Sea',NULL,NULL),
	('Texel','North Sea',NULL,NULL),
	('Krk','Mediterranean Sea',NULL,NULL),
	('Cres','Mediterranean Sea',NULL,NULL),
	('Bra?','Mediterranean Sea',NULL,NULL),
	('Kor?ula','Mediterranean Sea',NULL,NULL),
	('Korfu','Mediterranean Sea',NULL,NULL),
	('Lefkas','Mediterranean Sea',NULL,NULL),
	('Kefallinia','Mediterranean Sea',NULL,NULL),
	('Zakynthos','Mediterranean Sea',NULL,NULL),
	('Euboea','Mediterranean Sea',NULL,NULL),
	('Samothraki','Mediterranean Sea',NULL,NULL),
	('Lesbos','Mediterranean Sea',NULL,NULL),
	('Chios','Mediterranean Sea',NULL,NULL),
	('Samos','Mediterranean Sea',NULL,NULL),
	('Ikaria','Mediterranean Sea',NULL,NULL),
	('Kos','Mediterranean Sea',NULL,NULL),
	('Rhodos','Mediterranean Sea',NULL,NULL),
	('Syros','Mediterranean Sea',NULL,NULL),
	('Mykonos','Mediterranean Sea',NULL,NULL),
	('Crete','Mediterranean Sea',NULL,NULL),
	('Cyprus','Mediterranean Sea',NULL,NULL),
	('Corse','Mediterranean Sea',NULL,NULL),
	('Elba','Mediterranean Sea',NULL,NULL),
	('Sardegna','Mediterranean Sea',NULL,NULL),
	('Alicudi','Mediterranean Sea',NULL,NULL),
	('Filicudi','Mediterranean Sea',NULL,NULL),
	('Salina','Mediterranean Sea',NULL,NULL),
	('Lipari','Mediterranean Sea',NULL,NULL),
	('Vulcano','Mediterranean Sea',NULL,NULL),
	('Panarea','Mediterranean Sea',NULL,NULL),
	('Stromboli','Mediterranean Sea',NULL,NULL),
	('Sicilia','Mediterranean Sea',NULL,NULL),
	('Lampedusa','Mediterranean Sea',NULL,NULL),
	('Linosa','Mediterranean Sea',NULL,NULL),
	('Malta','Mediterranean Sea',NULL,NULL),
	('Gozo','Mediterranean Sea',NULL,NULL),
	('Menorca','Mediterranean Sea',NULL,NULL),
	('Mallorca','Mediterranean Sea',NULL,NULL),
	('Ibiza','Mediterranean Sea',NULL,NULL),
	('Formentera','Mediterranean Sea',NULL,NULL),
	('Lanzarote','Atlantic Ocean',NULL,NULL),
	('Fuerteventura','Atlantic Ocean',NULL,NULL),
	('Gran Canaria','Atlantic Ocean',NULL,NULL),
	('Teneriffa','Atlantic Ocean',NULL,NULL),
	('Gomera','Atlantic Ocean',NULL,NULL),
	('Hierro','Atlantic Ocean',NULL,NULL),
	('La Palma','Atlantic Ocean',NULL,NULL),
	('Madeira','Atlantic Ocean',NULL,NULL),
	('Porto Santo','Atlantic Ocean',NULL,NULL),
	('Sao Miguel','Atlantic Ocean',NULL,NULL),
	('Santa Maria','Atlantic Ocean',NULL,NULL),
	('Terceira','Atlantic Ocean',NULL,NULL),
	('Sao Jorge','Atlantic Ocean',NULL,NULL),
	('Pico','Atlantic Ocean',NULL,NULL),
	('Faial','Atlantic Ocean',NULL,NULL),
	('Graciosa','Atlantic Ocean',NULL,NULL),
	('Flores (Azores)','Atlantic Ocean',NULL,NULL),
	('Corvo','Atlantic Ocean',NULL,NULL),
	('Santiago','Atlantic Ocean',NULL,NULL),
	('Fogo','Atlantic Ocean',NULL,NULL),
	('Sao Tome','Atlantic Ocean',NULL,NULL),
	('Principe','Atlantic Ocean',NULL,NULL),
	('Bioko','Atlantic Ocean',NULL,NULL),
	('Saint Helena','Atlantic Ocean',NULL,NULL),
	('Ascension','Atlantic Ocean',NULL,NULL),
	('Tristan Da Cunha','Atlantic Ocean',NULL,NULL),
	('West Falkland','Atlantic Ocean',NULL,NULL),
	('East Falkland','Atlantic Ocean',NULL,NULL),
	('Bahrain','Persian Gulf',NULL,NULL),
	('Khark','Persian Gulf',NULL,NULL),
	('Qeshm','Gulf of Oman',NULL,NULL),
	('Qeshm','Persian Gulf',NULL,NULL),
	('Christmas Island','Indian Ocean',NULL,NULL),
	('Pulau Panjang','Indian Ocean',NULL,NULL),
	('Male','Indian Ocean',NULL,NULL),
	('Salsette','Arabian Sea',NULL,NULL),
	('Kavaratti','Arabian Sea',NULL,NULL),
	('Sri Lanka','Indian Ocean',NULL,NULL),
	('Sri Lanka','Gulf of Bengal',NULL,NULL),
	('South Andaman Island','Gulf of Bengal',NULL,NULL),
	('South Andaman Island','Andaman Sea',NULL,NULL),
	('Sokotra','Indian Ocean',NULL,NULL),
	('Sokotra','Arabian Sea',NULL,NULL),
	('Sokotra','Gulf of Aden',NULL,NULL),
	('Sansibar','Indian Ocean',NULL,NULL),
	('Pemba','Indian Ocean',NULL,NULL),
	('Mahe','Indian Ocean',NULL,NULL),
	('Grand Comoro','Indian Ocean',NULL,NULL),
	('Anjouan','Indian Ocean',NULL,NULL),
	('Mohéli','Indian Ocean',NULL,NULL),
	('Mayotte','Indian Ocean',NULL,NULL),
	('Reunion','Indian Ocean',NULL,NULL),
	('Mauritius','Indian Ocean',NULL,NULL),
	('Madagaskar','Indian Ocean',NULL,NULL),
	('Novaya Zemlya Severny Island','Barents Sea',NULL,NULL),
	('Novaya Zemlya Severny Island','Kara Sea',NULL,NULL),
	('Novaya Zemlya Severny Island','Arctic Ocean',NULL,NULL),
	('Novaya Zemlya Yuzhny Island','Barents Sea',NULL,NULL),
	('Novaya Zemlya Yuzhny Island','Kara Sea',NULL,NULL),
	('Kotelny Island','Arctic Ocean',NULL,NULL),
	('Kotelny Island','East Sibirian Sea',NULL,NULL),
	('Paramuschir','Pacific Ocean',NULL,NULL),
	('Paramuschir','Sea of Okhotsk',NULL,NULL),
	('Onekotan','Pacific Ocean',NULL,NULL),
	('Onekotan','Sea of Okhotsk',NULL,NULL),
	('Sachalin','Sea of Okhotsk',NULL,NULL),
	('Sachalin','Sea of Japan',NULL,NULL),
	('Hokkaido','Pacific Ocean',NULL,NULL),
	('Hokkaido','Sea of Okhotsk',NULL,NULL),
	('Hokkaido','Sea of Japan',NULL,NULL),
	('Honshu','Pacific Ocean',NULL,NULL),
	('Honshu','Sea of Japan',NULL,NULL),
	('Kyushu','Pacific Ocean',NULL,NULL),
	('Kyushu','Sea of Japan',NULL,NULL),
	('Kyushu','East China Sea',NULL,NULL),
	('Shikoku','Pacific Ocean',NULL,NULL),
	('Awajishima','Seto Inland Sea',NULL,NULL),
	('Okinawa','Pacific Ocean',NULL,NULL),
	('Okinawa','East China Sea',NULL,NULL),
	('Nishinoshima','Pacific Ocean',NULL,NULL),
	('Jeju','East China Sea',NULL,NULL),
	('Taiwan','Pacific Ocean',NULL,NULL),
	('Taiwan','East China Sea',NULL,NULL),
	('Taiwan','South China Sea',NULL,NULL),
	('Great Kinmen','South China Sea',NULL,NULL),
	('Xiamen','South China Sea',NULL,NULL),
	('Hainan','South China Sea',NULL,NULL),
	('Zhoushan','East China Sea',NULL,NULL),
	('Chongming','East China Sea',NULL,NULL),
	('Luzon','Pacific Ocean',NULL,NULL),
	('Luzon','South China Sea',NULL,NULL),
	('Mindoro','South China Sea',NULL,NULL),
	('Mindoro','Sulu Sea',NULL,NULL),
	('Sibuyan','Sulu Sea',NULL,NULL),
	('Panay','Sulu Sea',NULL,NULL),
	('Negros','Sulu Sea',NULL,NULL),
	('Cebu','Sulu Sea',NULL,NULL),
	('Bohol','Sulu Sea',NULL,NULL),
	('Leyte','Pacific Ocean',NULL,NULL),
	('Leyte','Sulu Sea',NULL,NULL),
	('Samar','Pacific Ocean',NULL,NULL),
	('Samar','Sulu Sea',NULL,NULL),
	('Mindanao','Pacific Ocean',NULL,NULL),
	('Mindanao','Sulawesi Sea',NULL,NULL),
	('Mindanao','Sulu Sea',NULL,NULL),
	('Palawan','South China Sea',NULL,NULL),
	('Palawan','Sulu Sea',NULL,NULL),
	('Ujong','South China Sea',NULL,NULL),
	('Ujong','Malakka Strait',NULL,NULL),
	('Penang','Malakka Strait',NULL,NULL),
	('Ko Samui','Andaman Sea',NULL,NULL),
	('Phuket','South China Sea',NULL,NULL),
	('Sumatra','South China Sea',NULL,NULL),
	('Sumatra','Indian Ocean',NULL,NULL),
	('Sumatra','Andaman Sea',NULL,NULL),
	('Sumatra','Malakka Strait',NULL,NULL),
	('Sumatra','Java Sea',NULL,NULL),
	('Batam','South China Sea',NULL,NULL),
	('Bintan','South China Sea',NULL,NULL),
	('Bangka','South China Sea',NULL,NULL),
	('Bangka','Java Sea',NULL,NULL),
	('Krakatau','Indian Ocean',NULL,NULL),
	('Krakatau','Java Sea',NULL,NULL),
	('Java','Indian Ocean',NULL,NULL),
	('Java','Java Sea',NULL,NULL),
	('Labuan','South China Sea',NULL,NULL),
	('Borneo','South China Sea',NULL,NULL),
	('Borneo','Java Sea',NULL,NULL),
	('Borneo','Sulawesi Sea',NULL,NULL),
	('Borneo','Sulu Sea',NULL,NULL),
	('Madura','Java Sea',NULL,NULL),
	('Bali','Indian Ocean',NULL,NULL),
	('Bali','Java Sea',NULL,NULL),
	('Lombok','Indian Ocean',NULL,NULL),
	('Lombok','Java Sea',NULL,NULL),
	('Sumbawa','Indian Ocean',NULL,NULL),
	('Sumbawa','Java Sea',NULL,NULL),
	('Sangeang','Java Sea',NULL,NULL),
	('Flores','Indian Ocean',NULL,NULL),
	('Flores','Java Sea',NULL,NULL),
	('Flores','Banda Sea',NULL,NULL),
	('Sumba','Indian Ocean',NULL,NULL),
	('Timor','Indian Ocean',NULL,NULL),
	('Timor','Banda Sea',NULL,NULL),
	('Sulawesi','Java Sea',NULL,NULL),
	('Sulawesi','Banda Sea',NULL,NULL),
	('Sulawesi','Sulawesi Sea',NULL,NULL),
	('Buru','Banda Sea',NULL,NULL),
	('Ambon','Banda Sea',NULL,NULL),
	('Ceram','Banda Sea',NULL,NULL),
	('Halmahera','Pacific Ocean',NULL,NULL),
	('Halmahera','Banda Sea',NULL,NULL),
	('Ternate','Banda Sea',NULL,NULL),
	('New Guinea','Pacific Ocean',NULL,NULL),
	('New Guinea','Banda Sea',NULL,NULL),
	('New Guinea','Arafura Sea',NULL,NULL),
	('New Guinea','Coral Sea',NULL,NULL),
	('Goodenough Island','Pacific Ocean',NULL,NULL),
	('Bougainville','Pacific Ocean',NULL,NULL),
	('New Britain','Pacific Ocean',NULL,NULL),
	('New Ireland','Pacific Ocean',NULL,NULL),
	('Guadalcanal','Pacific Ocean',NULL,NULL),
	('Guadalcanal','Coral Sea',NULL,NULL),
	('Kolombangara','Pacific Ocean',NULL,NULL),
	('Grande Terre','Pacific Ocean',NULL,NULL),
	('Grande Terre','Coral Sea',NULL,NULL),
	('Grande Terre','Tasman Sea',NULL,NULL),
	('Cangaroo Island','Indian Ocean',NULL,NULL),
	('Melville Island','Indian Ocean',NULL,NULL),
	('Lord Howe Island','Tasman Sea',NULL,NULL),
	('Ball''s Pyramid','Tasman Sea',NULL,NULL),
	('Tasmania','Indian Ocean',NULL,NULL),
	('Tasmania','Tasman Sea',NULL,NULL),
	('Victoria Island','Arctic Ocean',NULL,NULL),
	('Banks Island','Arctic Ocean',NULL,NULL),
	('Prince of Wales Island','Arctic Ocean',NULL,NULL),
	('Baffin Island','Arctic Ocean',NULL,NULL),
	('Baffin Island','Hudson Bay',NULL,NULL),
	('Baffin Island','Labrador Sea',NULL,NULL),
	('Southampton Island','Hudson Bay',NULL,NULL),
	('Ellesmere Island','Arctic Ocean',NULL,NULL),
	('Ellesmere Island','Labrador Sea',NULL,NULL),
	('Devon Island','Arctic Ocean',NULL,NULL),
	('Devon Island','Labrador Sea',NULL,NULL),
	('Saint Pierre','Atlantic Ocean',NULL,NULL),
	('Miquelon-Langlade','Atlantic Ocean',NULL,NULL),
	('Newfoundland','Atlantic Ocean',NULL,NULL),
	('Prince Edward Island','Atlantic Ocean',NULL,NULL),
	('Marthas Vineyard','Atlantic Ocean',NULL,NULL),
	('Nantucket','Atlantic Ocean',NULL,NULL),
	('Long Island','Atlantic Ocean',NULL,NULL),
	('Manhattan','Atlantic Ocean',NULL,NULL),
	('Staten Island','Atlantic Ocean',NULL,NULL),
	('Unalaska','Bering Sea',NULL,NULL),
	('Unalaska','Pacific Ocean',NULL,NULL),
	('Unimak','Bering Sea',NULL,NULL),
	('Unimak','Pacific Ocean',NULL,NULL),
	('Vancouver Island','Pacific Ocean',NULL,NULL),
	('Santa Cruz Island','Pacific Ocean',NULL,NULL),
	('Santa Catalina Island','Pacific Ocean',NULL,NULL),
	('Santa Rosa Island','Pacific Ocean',NULL,NULL),
	('San Clemente Island','Pacific Ocean',NULL,NULL),
	('San Miguel Island','Pacific Ocean',NULL,NULL),
	('Grand Bermuda','Atlantic Ocean',NULL,NULL),
	('New Providence','Atlantic Ocean',NULL,NULL),
	('Grand Turk','Atlantic Ocean',NULL,NULL),
	('Providenciales','Atlantic Ocean',NULL,NULL),
	('North Caicos','Atlantic Ocean',NULL,NULL),
	('Cuba','Atlantic Ocean',NULL,NULL),
	('Cuba','Gulf of Mexico',NULL,NULL),
	('Cuba','Caribbean Sea',NULL,NULL),
	('Isla de la Juventud','Caribbean Sea',NULL,NULL),
	('Jamaica','Caribbean Sea',NULL,NULL),
	('Hispaniola','Atlantic Ocean',NULL,NULL),
	('Hispaniola','Caribbean Sea',NULL,NULL),
	('Puerto Rico','Atlantic Ocean',NULL,NULL),
	('Puerto Rico','Caribbean Sea',NULL,NULL),
	('Tortola','Atlantic Ocean',NULL,NULL),
	('Tortola','Caribbean Sea',NULL,NULL),
	('Saint Thomas','Atlantic Ocean',NULL,NULL),
	('Saint Thomas','Caribbean Sea',NULL,NULL),
	('Anguilla','Atlantic Ocean',NULL,NULL),
	('Anguilla','Caribbean Sea',NULL,NULL),
	('St. Martin','Atlantic Ocean',NULL,NULL),
	('St. Martin','Caribbean Sea',NULL,NULL),
	('St. Barthelemy','Atlantic Ocean',NULL,NULL),
	('St. Barthelemy','Caribbean Sea',NULL,NULL),
	('Saint Kitts','Atlantic Ocean',NULL,NULL),
	('Saint Kitts','Caribbean Sea',NULL,NULL),
	('Nevis','Atlantic Ocean',NULL,NULL),
	('Nevis','Caribbean Sea',NULL,NULL),
	('Barbuda','Atlantic Ocean',NULL,NULL),
	('Barbuda','Caribbean Sea',NULL,NULL),
	('Antigua','Atlantic Ocean',NULL,NULL),
	('Antigua','Caribbean Sea',NULL,NULL),
	('Montserrat','Atlantic Ocean',NULL,NULL),
	('Montserrat','Caribbean Sea',NULL,NULL),
	('Basse-Terre','Atlantic Ocean',NULL,NULL),
	('Basse-Terre','Caribbean Sea',NULL,NULL),
	('Grande-Terre','Atlantic Ocean',NULL,NULL),
	('Grande-Terre','Caribbean Sea',NULL,NULL),
	('Dominica','Atlantic Ocean',NULL,NULL),
	('Dominica','Caribbean Sea',NULL,NULL),
	('Martinique','Atlantic Ocean',NULL,NULL),
	('Martinique','Caribbean Sea',NULL,NULL),
	('Saint Lucia','Atlantic Ocean',NULL,NULL),
	('Saint Lucia','Caribbean Sea',NULL,NULL),
	('Saint Vincent','Atlantic Ocean',NULL,NULL),
	('Saint Vincent','Caribbean Sea',NULL,NULL),
	('Barbados','Atlantic Ocean',NULL,NULL),
	('Grenada','Atlantic Ocean',NULL,NULL),
	('Grenada','Caribbean Sea',NULL,NULL),
	('Trinidad','Atlantic Ocean',NULL,NULL),
	('Trinidad','Caribbean Sea',NULL,NULL),
	('Tobago','Atlantic Ocean',NULL,NULL),
	('Tobago','Caribbean Sea',NULL,NULL),
	('Curacao','Caribbean Sea',NULL,NULL),
	('Aruba','Caribbean Sea',NULL,NULL),
	('Grand Cayman','Caribbean Sea',NULL,NULL),
	('Little Cayman','Caribbean Sea',NULL,NULL),
	('Cayman Brac','Caribbean Sea',NULL,NULL),
	('San Andres','Caribbean Sea',NULL,NULL),
	('Isabela','Pacific Ocean',NULL,NULL),
	('Marajó','Atlantic Ocean',NULL,NULL),
	('Ilha de São Luís','Atlantic Ocean',NULL,NULL),
	('Ilha de Vitória','Atlantic Ocean',NULL,NULL),
	('Ilha de São Vicente','Atlantic Ocean',NULL,NULL),
	('Ilha de Sãnto Amaro','Atlantic Ocean',NULL,NULL),
	('Ilha de Santa Catarina','Atlantic Ocean',NULL,NULL),
	('Chiloé','Pacific Ocean',NULL,NULL),
	('Tierra del Fuego','Atlantic Ocean',NULL,NULL),
	('Tierra del Fuego','Pacific Ocean',NULL,NULL),
	('Niihau','Pacific Ocean',NULL,NULL),
	('Kauai','Pacific Ocean',NULL,NULL),
	('Oahu','Pacific Ocean',NULL,NULL),
	('Molokai','Pacific Ocean',NULL,NULL),
	('Lanai','Pacific Ocean',NULL,NULL),
	('Maui','Pacific Ocean',NULL,NULL),
	('Hawaii','Pacific Ocean',NULL,NULL),
	('Niue','Pacific Ocean',NULL,NULL),
	('Saipan','Pacific Ocean',NULL,NULL),
	('Tinian','Pacific Ocean',NULL,NULL),
	('Rota','Pacific Ocean',NULL,NULL),
	('Uvea','Pacific Ocean',NULL,NULL),
	('Futuna','Pacific Ocean',NULL,NULL),
	('Tarawa','Pacific Ocean',NULL,NULL),
	('Kiritimati','Pacific Ocean',NULL,NULL),
	('Banaba','Pacific Ocean',NULL,NULL),
	('Tongatapu','Pacific Ocean',NULL,NULL),
	('Kao','Pacific Ocean',NULL,NULL),
	('Viti Levu','Pacific Ocean',NULL,NULL),
	('Vanua Levu','Pacific Ocean',NULL,NULL),
	('Norfolk Island','Pacific Ocean',NULL,NULL),
	('Norfolk Island','Tasman Sea',NULL,NULL),
	('Nauru','Pacific Ocean',NULL,NULL),
	('Koror','Pacific Ocean',NULL,NULL),
	('Babelthuap','Pacific Ocean',NULL,NULL),
	('Fongafale','Pacific Ocean',NULL,NULL),
	('Fakaofo','Pacific Ocean',NULL,NULL),
	('Espiritu Santo','Pacific Ocean',NULL,NULL),
	('Espiritu Santo','Coral Sea',NULL,NULL),
	('Efate','Pacific Ocean',NULL,NULL),
	('Efate','Coral Sea',NULL,NULL),
	('Upolu','Pacific Ocean',NULL,NULL),
	('Savaii','Pacific Ocean',NULL,NULL),
	('Tutuila','Pacific Ocean',NULL,NULL),
	('Rarotonga','Pacific Ocean',NULL,NULL),
	('Tahiti','Pacific Ocean',NULL,NULL),
	('Ra''i?tea','Pacific Ocean',NULL,NULL),
	('Mangareva','Pacific Ocean',NULL,NULL),
	('Makatea','Pacific Ocean',NULL,NULL),
	('Rangiroa','Pacific Ocean',NULL,NULL),
	('Guam','Pacific Ocean',NULL,NULL),
	('Majuro','Pacific Ocean',NULL,NULL),
	('Kwajalein','Pacific Ocean',NULL,NULL),
	('Pohnpei','Pacific Ocean',NULL,NULL),
	('Pitcairn','Pacific Ocean',NULL,NULL),
	('Henderson Island','Pacific Ocean',NULL,NULL),
	('Easter Island','Pacific Ocean',NULL,NULL),
	('Te Ika-a-Maui (North Island)','Pacific Ocean',NULL,NULL),
	('Te Ika-a-Maui (North Island)','Tasman Sea',NULL,NULL),
	('Te Waka-a-Maui (South Island)','Pacific Ocean',NULL,NULL),
	('Te Waka-a-Maui (South Island)','Tasman Sea',NULL,NULL),
	('Ukerewe',NULL,'Lake Victoria',NULL),
	('Krenizyn',NULL,'Koltsevoye Lake',NULL),
	('Olkhon',NULL,'Ozero Baikal',NULL),
	('Taal Volcano Island',NULL,'Lake Taal',NULL),
	('Taal Vulcan Point',NULL,'Taal Crater Lake',NULL),
	('Samosir',NULL,'Lake Toba',NULL),
	('Rene Levasseur Island',NULL,'Lake Manicouagan',NULL),
	('Teresa Island',NULL,'Atlin Lake',NULL),
	('Manitoulin',NULL,'Lake Huron',NULL),
	('Treasure Island',NULL,'Lake Mindemoya',NULL),
	('Isla da Ometepe',NULL,'Lake Nicaragua',NULL),
	('Amantaní',NULL,'Lake Titicaca',NULL),
	('Zitny Ostrov',NULL,NULL, 'Donau'),
	('Zitny Ostrov',NULL,NULL, 'Waag'),
	('Maly Zitny Ostrov',NULL,NULL, 'Donau'),
	('Margit Sziget',NULL,NULL, 'Donau'),
	('Veliko Ratno Ostrvo',NULL,NULL, 'Donau'),
	('Veliko Ratno Ostrvo',NULL,NULL, 'Save'),
	('Impalila',NULL,NULL, 'Zambezi'),
	('Chongming',NULL,NULL, 'Yangtze'),
	('Île de Montréal',NULL,NULL, 'Saint Lawrence River'),
	('Île Jésus',NULL,NULL, 'Saint Lawrence River'),
	('Manhattan',NULL,NULL, 'Hudson River'),
	('Marajó',NULL,NULL, 'Tocantins'),
	('Marajó',NULL,NULL, 'Araguaia'),
	('Ilha do Bananal',NULL,NULL, 'Araguaia')
;
