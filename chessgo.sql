
DROP DATABASE chessgo;
CREATE DATABASE chessgo;
USE chessgo;

CREATE TABLE country(
id int not null,
name varchar(50) not null,
PRIMARY KEY (id)
);

CREATE TABLE player(
id int not null,
firstName varchar(50),
lastName varchar(50),
email  varchar(50),
elo int not null,
countryId int not null,
disabled bool null,
PRIMARY KEY (id),
FOREIGN KEY (countryId) REFERENCES country(id)
);

CREATE TABLE playerFriend(
playerId int not null,  
playerFriend int not null,
PRIMARY KEY (playerId,playerFriend),
FOREIGN KEY (playerId) REFERENCES player(id),
FOREIGN KEY (playerFriend) REFERENCES player(id)
);

CREATE TABLE message(
id int not null,
recipientId int not null,
senderId int not null,
message varchar(500),
PRIMARY KEY (id, recipientId, senderId),
FOREIGN KEY (recipientId) REFERENCES player(id),
FOREIGN KEY (senderId) REFERENCES player(id)
);

CREATE TABLE membershipType(
id int not null,
name varchar(50) not null,
description varchar(250) not null,
price decimal(10,2) not null,
PRIMARY KEY (id)
);

CREATE TABLE membership(
id int not null,
playerId int not null,
membershipTypeId int not null,
startDate date not null,
expirationDate date not null,
disabled bool,
PRIMARY KEY (id),
FOREIGN KEY (playerId) REFERENCES player(id),
FOREIGN KEY (membershipTypeId) REFERENCES membershipType(id)
);


CREATE TABLE TypeOfMatch(
id int not null,
name varchar(50),
label varchar(50),
PRIMARY KEY (id)
);

CREATE TABLE resultType(
id int not null,
name varchar(50),
label varchar(50),
points float not null,
PRIMARY KEY (id)
);



CREATE TABLE matchGame(
id int not null,
typeOfMatchId int not null,
datePlayed date not null,
PRIMARY KEY (id),
FOREIGN KEY (typeOfMatchId) REFERENCES TypeOfMatch(id)
);



CREATE TABLE playerMatchGame(
playerId int not null,
matchGameId int not null,
white bool not null,
resultTypeId int not null,
PRIMARY KEY (playerId,matchGameId,white),
FOREIGN KEY (playerId) REFERENCES player(id),
FOREIGN KEY (matchGameId) REFERENCES matchGame(id),
FOREIGN KEY (resultTypeId) REFERENCES resultType(id)
);



CREATE TABLE tournament(
id int not null,
name varchar(100) not null,
year year not null,
startDate date null,
endDate date null,
countryId int not null,
entryFee decimal(10,2) null,
prize decimal(10,2) null,
PRIMARY KEY (id),
FOREIGN KEY (countryId) REFERENCES country(id)
);



CREATE TABLE tournamentPlayer(
tournamentId int  not null,
playerId int  not null,
points float  not null,
ranking int not null,
PRIMARY KEY (tournamentId,playerId ),
FOREIGN KEY (tournamentId) REFERENCES tournament(id),
FOREIGN KEY (playerId) REFERENCES player(id)
);

CREATE TABLE tournamentMatch(
tournamentId int not null,
matchId int not null,
PRIMARY KEY (tournamentId, matchId),
FOREIGN KEY (tournamentId) REFERENCES tournament(id),
FOREIGN KEY (matchId) REFERENCES matchGame(id)
);

CREATE TABLE move(
id int not null,
matchGameId int not null,
moveOrder int not null,
whiteMove varchar(10),
blackMove varchar(10),
whiteMoveTime time,
blackMoveTIme time,
FOREIGN KEY (matchGameId) REFERENCES matchGame(id)
);

#Insert Data
#Country
INSERT INTO COUNTRY (id, name) VALUES (1, 'Afghanistan');
INSERT INTO COUNTRY (id, name) VALUES (2, 'Albania');
INSERT INTO COUNTRY (id, name) VALUES (3, 'Algeria');
INSERT INTO COUNTRY (id, name) VALUES (4, 'American Samoa');
INSERT INTO COUNTRY (id, name) VALUES (5, 'Andorra');
INSERT INTO COUNTRY (id, name) VALUES (6, 'Angola');
INSERT INTO COUNTRY (id, name) VALUES (7, 'Anguilla');
INSERT INTO COUNTRY (id, name) VALUES (8, 'Anatarctica');
INSERT INTO COUNTRY (id, name) VALUES (9, 'Antigua and Barbuda');
INSERT INTO COUNTRY (id, name) VALUES (10, 'Argentina');
INSERT INTO COUNTRY (id, name) VALUES (11, 'Armenia');
INSERT INTO COUNTRY (id, name) VALUES (12, 'Aruba');
INSERT INTO COUNTRY (id, name) VALUES (13, 'Australia');
INSERT INTO COUNTRY (id, name) VALUES (14, 'Austria');
INSERT INTO COUNTRY (id, name) VALUES (15, 'Azerbaijan');
INSERT INTO COUNTRY (id, name) VALUES (16, 'Bahamas');
INSERT INTO COUNTRY (id, name) VALUES (17, 'Bahrain');
INSERT INTO COUNTRY (id, name) VALUES (18, 'Bangladesh');
INSERT INTO COUNTRY (id, name) VALUES (19, 'Barbados');
INSERT INTO COUNTRY (id, name) VALUES (20, 'Belarus');
INSERT INTO COUNTRY (id, name) VALUES (21, 'Belgium');
INSERT INTO COUNTRY (id, name) VALUES (22, 'Belize');
INSERT INTO COUNTRY (id, name) VALUES (23, 'Benin');
INSERT INTO COUNTRY (id, name) VALUES (24, 'Bermuda');
INSERT INTO COUNTRY (id, name) VALUES (25, 'Bhutan');
INSERT INTO COUNTRY (id, name) VALUES (26, 'Bolivia');
INSERT INTO COUNTRY (id, name) VALUES (27, 'Bonaire');
INSERT INTO COUNTRY (id, name) VALUES (28, 'Bosnia and Herzegovina');
INSERT INTO COUNTRY (id, name) VALUES (29, 'Botswana');
INSERT INTO COUNTRY (id, name) VALUES (30, 'Bouvet Island');
INSERT INTO COUNTRY (id, name) VALUES (31, 'Brazil');
INSERT INTO COUNTRY (id, name) VALUES (32, 'British Indian Ocean Territory');
INSERT INTO COUNTRY (id, name) VALUES (33, 'Brunei Darussalam');
INSERT INTO COUNTRY (id, name) VALUES (34, 'Bulgaria');
INSERT INTO COUNTRY (id, name) VALUES (35, 'Burkina Faso');
INSERT INTO COUNTRY (id, name) VALUES (36, 'Burundi');
INSERT INTO COUNTRY (id, name) VALUES (37, 'Cambodia');
INSERT INTO COUNTRY (id, name) VALUES (38, 'Cameroon');
INSERT INTO COUNTRY (id, name) VALUES (39, 'Canada');
INSERT INTO COUNTRY (id, name) VALUES (40, 'Cape Verde');
INSERT INTO COUNTRY (id, name) VALUES (41, 'Cayman Islands');
INSERT INTO COUNTRY (id, name) VALUES (42, 'Central African Republic');
INSERT INTO COUNTRY (id, name) VALUES (43, 'Chad');
INSERT INTO COUNTRY (id, name) VALUES (44, 'Chile');
INSERT INTO COUNTRY (id, name) VALUES (45, 'China');
INSERT INTO COUNTRY (id, name) VALUES (46, 'Christmas Island');
INSERT INTO COUNTRY (id, name) VALUES (47, 'Cocos (Keeling) Islands');
INSERT INTO COUNTRY (id, name) VALUES (48, 'Colombia');
INSERT INTO COUNTRY (id, name) VALUES (49, 'Comoros');
INSERT INTO COUNTRY (id, name) VALUES (50, 'Congo');
INSERT INTO COUNTRY (id, name) VALUES (51, 'Congo');
INSERT INTO COUNTRY (id, name) VALUES (52, 'Cook Islands');
INSERT INTO COUNTRY (id, name) VALUES (53, 'Costa Rica');
INSERT INTO COUNTRY (id, name) VALUES (54, 'Croatia');
INSERT INTO COUNTRY (id, name) VALUES (55, 'Cuba');
INSERT INTO COUNTRY (id, name) VALUES (56, 'Cyprus');
INSERT INTO COUNTRY (id, name) VALUES (57, 'Czech Republic');
INSERT INTO COUNTRY (id, name) VALUES (58, 'Denmark');
INSERT INTO COUNTRY (id, name) VALUES (59, 'Djibouti');
INSERT INTO COUNTRY (id, name) VALUES (60, 'Dominica');
INSERT INTO COUNTRY (id, name) VALUES (61, 'Dominican Republic');
INSERT INTO COUNTRY (id, name) VALUES (62, 'Ecuador');
INSERT INTO COUNTRY (id, name) VALUES (63, 'Egypt');
INSERT INTO COUNTRY (id, name) VALUES (64, 'El Salvador');
INSERT INTO COUNTRY (id, name) VALUES (65, 'Equatorial Guinea');
INSERT INTO COUNTRY (id, name) VALUES (66, 'Eritrea');
INSERT INTO COUNTRY (id, name) VALUES (67, 'Estonia');
INSERT INTO COUNTRY (id, name) VALUES (68, 'Ethiopia');
INSERT INTO COUNTRY (id, name) VALUES (69, 'Falkland Islands (Malvinas)');
INSERT INTO COUNTRY (id, name) VALUES (70, 'Faroe Islands');
INSERT INTO COUNTRY (id, name) VALUES (71, 'Fiji');
INSERT INTO COUNTRY (id, name) VALUES (72, 'Finland');
INSERT INTO COUNTRY (id, name) VALUES (73, 'France');
INSERT INTO COUNTRY (id, name) VALUES (74, 'French Guiana');
INSERT INTO COUNTRY (id, name) VALUES (75, 'French Polynesia');
INSERT INTO COUNTRY (id, name) VALUES (76, 'French Southern Territories');
INSERT INTO COUNTRY (id, name) VALUES (77, 'Gabon');
INSERT INTO COUNTRY (id, name) VALUES (78, 'Gambia');
INSERT INTO COUNTRY (id, name) VALUES (79, 'Georgia');
INSERT INTO COUNTRY (id, name) VALUES (80, 'Germany');
INSERT INTO COUNTRY (id, name) VALUES (81, 'Ghana');
INSERT INTO COUNTRY (id, name) VALUES (82, 'Gibraltar');
INSERT INTO COUNTRY (id, name) VALUES (83, 'Greece');
INSERT INTO COUNTRY (id, name) VALUES (84, 'Greenland');
INSERT INTO COUNTRY (id, name) VALUES (85, 'Grenada');
INSERT INTO COUNTRY (id, name) VALUES (86, 'Guadeloupe');
INSERT INTO COUNTRY (id, name) VALUES (87, 'Guam');
INSERT INTO COUNTRY (id, name) VALUES (88, 'Guatemala');
INSERT INTO COUNTRY (id, name) VALUES (89, 'Guernsey');
INSERT INTO COUNTRY (id, name) VALUES (90, 'Guinea');
INSERT INTO COUNTRY (id, name) VALUES (91, 'Guinea-Bissau');
INSERT INTO COUNTRY (id, name) VALUES (92, 'Guyana');
INSERT INTO COUNTRY (id, name) VALUES (93, 'Haiti');
INSERT INTO COUNTRY (id, name) VALUES (94, 'Heard Island and McDonald Islands');
INSERT INTO COUNTRY (id, name) VALUES (95, 'Holy See (Vatican City State)');
INSERT INTO COUNTRY (id, name) VALUES (96, 'Honduras');
INSERT INTO COUNTRY (id, name) VALUES (97, 'Hong Kong');
INSERT INTO COUNTRY (id, name) VALUES (98, 'Hungary');
INSERT INTO COUNTRY (id, name) VALUES (99, 'Iceland');
INSERT INTO COUNTRY (id, name) VALUES (100, 'India');
INSERT INTO COUNTRY (id, name) VALUES (101, 'Indonesia');
INSERT INTO COUNTRY (id, name) VALUES (102, 'Iran');
INSERT INTO COUNTRY (id, name) VALUES (103, 'Iraq');
INSERT INTO COUNTRY (id, name) VALUES (104, 'Ireland');
INSERT INTO COUNTRY (id, name) VALUES (105, 'Isle of Man');
INSERT INTO COUNTRY (id, name) VALUES (106, 'Israel');
INSERT INTO COUNTRY (id, name) VALUES (107, 'Italy');
INSERT INTO COUNTRY (id, name) VALUES (108, 'Jamaica');
INSERT INTO COUNTRY (id, name) VALUES (109, 'Japan');
INSERT INTO COUNTRY (id, name) VALUES (110, 'Jersey');
INSERT INTO COUNTRY (id, name) VALUES (111, 'Jordan');
INSERT INTO COUNTRY (id, name) VALUES (112, 'Kazakhstan');
INSERT INTO COUNTRY (id, name) VALUES (113, 'Kenya');
INSERT INTO COUNTRY (id, name) VALUES (114, 'Kiribati');
INSERT INTO COUNTRY (id, name) VALUES (115, 'Korea');
INSERT INTO COUNTRY (id, name) VALUES (116, 'Korea');
INSERT INTO COUNTRY (id, name) VALUES (117, 'Kuwait');
INSERT INTO COUNTRY (id, name) VALUES (118, 'Kyrgyzstan');
INSERT INTO COUNTRY (id, name) VALUES (119, 'Lao People s Democratic Republic');
INSERT INTO COUNTRY (id, name) VALUES (120, 'Latvia');
INSERT INTO COUNTRY (id, name) VALUES (121, 'Lebanon');
INSERT INTO COUNTRY (id, name) VALUES (122, 'Lesotho');
INSERT INTO COUNTRY (id, name) VALUES (123, 'Liberia');
INSERT INTO COUNTRY (id, name) VALUES (124, 'Libya');
INSERT INTO COUNTRY (id, name) VALUES (125, 'Liechtenstein');
INSERT INTO COUNTRY (id, name) VALUES (126, 'Lithuania');
INSERT INTO COUNTRY (id, name) VALUES (127, 'Luxembourg');
INSERT INTO COUNTRY (id, name) VALUES (128, 'Macao');
INSERT INTO COUNTRY (id, name) VALUES (129, 'Macedonia');
INSERT INTO COUNTRY (id, name) VALUES (130, 'Madagascar');
INSERT INTO COUNTRY (id, name) VALUES (131, 'Malawi');
INSERT INTO COUNTRY (id, name) VALUES (132, 'Malaysia');
INSERT INTO COUNTRY (id, name) VALUES (133, 'Maldives');
INSERT INTO COUNTRY (id, name) VALUES (134, 'Mali');
INSERT INTO COUNTRY (id, name) VALUES (135, 'Malta');
INSERT INTO COUNTRY (id, name) VALUES (136, 'Marshall Islands');
INSERT INTO COUNTRY (id, name) VALUES (137, 'Martinique');
INSERT INTO COUNTRY (id, name) VALUES (138, 'Mauritania');
INSERT INTO COUNTRY (id, name) VALUES (139, 'Mauritius');
INSERT INTO COUNTRY (id, name) VALUES (140, 'Mayotte');
INSERT INTO COUNTRY (id, name) VALUES (141, 'Mexico');
INSERT INTO COUNTRY (id, name) VALUES (142, 'Micronesia');
INSERT INTO COUNTRY (id, name) VALUES (143, 'Moldova');
INSERT INTO COUNTRY (id, name) VALUES (144, 'Monaco');
INSERT INTO COUNTRY (id, name) VALUES (145, 'Mongolia');
INSERT INTO COUNTRY (id, name) VALUES (146, 'Montenegro');
INSERT INTO COUNTRY (id, name) VALUES (147, 'Montserrat');
INSERT INTO COUNTRY (id, name) VALUES (148, 'Morocco');
INSERT INTO COUNTRY (id, name) VALUES (149, 'Mozambique');
INSERT INTO COUNTRY (id, name) VALUES (150, 'Myanmar');
INSERT INTO COUNTRY (id, name) VALUES (151, 'Namibia');
INSERT INTO COUNTRY (id, name) VALUES (152, 'Nauru');
INSERT INTO COUNTRY (id, name) VALUES (153, 'Nepal');
INSERT INTO COUNTRY (id, name) VALUES (154, 'Netherlands');
INSERT INTO COUNTRY (id, name) VALUES (155, 'New Caledonia');
INSERT INTO COUNTRY (id, name) VALUES (156, 'New Zealand');
INSERT INTO COUNTRY (id, name) VALUES (157, 'Nicaragua');
INSERT INTO COUNTRY (id, name) VALUES (158, 'Niger');
INSERT INTO COUNTRY (id, name) VALUES (159, 'Nigeria');
INSERT INTO COUNTRY (id, name) VALUES (160, 'Niue');
INSERT INTO COUNTRY (id, name) VALUES (161, 'Norfolk Island');
INSERT INTO COUNTRY (id, name) VALUES (162, 'Northern Mariana Islands');
INSERT INTO COUNTRY (id, name) VALUES (163, 'Norway');
INSERT INTO COUNTRY (id, name) VALUES (164, 'Oman');
INSERT INTO COUNTRY (id, name) VALUES (165, 'Pakistan');
INSERT INTO COUNTRY (id, name) VALUES (166, 'Palau');
INSERT INTO COUNTRY (id, name) VALUES (167, 'Palestine');
INSERT INTO COUNTRY (id, name) VALUES (168, 'Panama');
INSERT INTO COUNTRY (id, name) VALUES (169, 'Papua New Guinea');
INSERT INTO COUNTRY (id, name) VALUES (170, 'Paraguay');
INSERT INTO COUNTRY (id, name) VALUES (171, 'Peru');
INSERT INTO COUNTRY (id, name) VALUES (172, 'Philippines');
INSERT INTO COUNTRY (id, name) VALUES (173, 'Pitcairn');
INSERT INTO COUNTRY (id, name) VALUES (174, 'Poland');
INSERT INTO COUNTRY (id, name) VALUES (175, 'Portugal');
INSERT INTO COUNTRY (id, name) VALUES (176, 'Puerto Rico');
INSERT INTO COUNTRY (id, name) VALUES (177, 'Qatar');
INSERT INTO COUNTRY (id, name) VALUES (178, 'RÃ©union');
INSERT INTO COUNTRY (id, name) VALUES (179, 'Romania');
INSERT INTO COUNTRY (id, name) VALUES (180, 'Russian Federation');
INSERT INTO COUNTRY (id, name) VALUES (181, 'Rwanda');
INSERT INTO COUNTRY (id, name) VALUES (182, 'Saint Helena');
INSERT INTO COUNTRY (id, name) VALUES (183, 'Saint Kitts and Nevis');
INSERT INTO COUNTRY (id, name) VALUES (184, 'Saint Lucia');
INSERT INTO COUNTRY (id, name) VALUES (185, 'Saint Martin (French part)');
INSERT INTO COUNTRY (id, name) VALUES (186, 'Saint Pierre and Miquelon');
INSERT INTO COUNTRY (id, name) VALUES (187, 'Saint Vincent and the Grenadines');
INSERT INTO COUNTRY (id, name) VALUES (188, 'Samoa');
INSERT INTO COUNTRY (id, name) VALUES (189, 'San Marino');
INSERT INTO COUNTRY (id, name) VALUES (190, 'Sao Tome and Principe');
INSERT INTO COUNTRY (id, name) VALUES (191, 'Saudi Arabia');
INSERT INTO COUNTRY (id, name) VALUES (192, 'Senegal');
INSERT INTO COUNTRY (id, name) VALUES (193, 'Serbia');
INSERT INTO COUNTRY (id, name) VALUES (194, 'Seychelles');
INSERT INTO COUNTRY (id, name) VALUES (195, 'Sierra Leone');
INSERT INTO COUNTRY (id, name) VALUES (196, 'Singapore');
INSERT INTO COUNTRY (id, name) VALUES (197, 'Sint Maarten (Dutch part)');
INSERT INTO COUNTRY (id, name) VALUES (198, 'Slovakia');
INSERT INTO COUNTRY (id, name) VALUES (199, 'Slovenia');
INSERT INTO COUNTRY (id, name) VALUES (200, 'Solomon Islands');
INSERT INTO COUNTRY (id, name) VALUES (201, 'Somalia');
INSERT INTO COUNTRY (id, name) VALUES (202, 'South Africa');
INSERT INTO COUNTRY (id, name) VALUES (203, 'South Georgia and the South Sandwich Islands');
INSERT INTO COUNTRY (id, name) VALUES (204, 'South Sudan');
INSERT INTO COUNTRY (id, name) VALUES (205, 'Spain');
INSERT INTO COUNTRY (id, name) VALUES (206, 'Sri Lanka');
INSERT INTO COUNTRY (id, name) VALUES (207, 'Sudan');
INSERT INTO COUNTRY (id, name) VALUES (208, 'Suriname');
INSERT INTO COUNTRY (id, name) VALUES (209, 'Svalbard and Jan Mayen');
INSERT INTO COUNTRY (id, name) VALUES (210, 'Swaziland');
INSERT INTO COUNTRY (id, name) VALUES (211, 'Sweden');
INSERT INTO COUNTRY (id, name) VALUES (212, 'Switzerland');
INSERT INTO COUNTRY (id, name) VALUES (213, 'Syrian Arab Republic');
INSERT INTO COUNTRY (id, name) VALUES (214, 'Taiwan');
INSERT INTO COUNTRY (id, name) VALUES (215, 'Tajikistan');
INSERT INTO COUNTRY (id, name) VALUES (216, 'Tanzania');
INSERT INTO COUNTRY (id, name) VALUES (217, 'Thailand');
INSERT INTO COUNTRY (id, name) VALUES (218, 'Timor-Leste');
INSERT INTO COUNTRY (id, name) VALUES (219, 'Togo');
INSERT INTO COUNTRY (id, name) VALUES (220, 'Tokelau');
INSERT INTO COUNTRY (id, name) VALUES (221, 'Tonga');
INSERT INTO COUNTRY (id, name) VALUES (222, 'Trinidad and Tobago');
INSERT INTO COUNTRY (id, name) VALUES (223, 'Tunisia');
INSERT INTO COUNTRY (id, name) VALUES (224, 'Turkey');
INSERT INTO COUNTRY (id, name) VALUES (225, 'Turkmenistan');
INSERT INTO COUNTRY (id, name) VALUES (226, 'Turks and Caicos Islands');
INSERT INTO COUNTRY (id, name) VALUES (227, 'Tuvalu');
INSERT INTO COUNTRY (id, name) VALUES (228, 'Uganda');
INSERT INTO COUNTRY (id, name) VALUES (229, 'Ukraine');
INSERT INTO COUNTRY (id, name) VALUES (230, 'United Arab Emirates');
INSERT INTO COUNTRY (id, name) VALUES (231, 'United Kingdom');
INSERT INTO COUNTRY (id, name) VALUES (232, 'United States');
INSERT INTO COUNTRY (id, name) VALUES (233, 'United States Minor Outlying Islands');
INSERT INTO COUNTRY (id, name) VALUES (234, 'Uruguay');
INSERT INTO COUNTRY (id, name) VALUES (235, 'Uzbekistan');
INSERT INTO COUNTRY (id, name) VALUES (236, 'Vanuatu');
INSERT INTO COUNTRY (id, name) VALUES (237, 'Venezuela');
INSERT INTO COUNTRY (id, name) VALUES (238, 'Viet Nam');
INSERT INTO COUNTRY (id, name) VALUES (239, 'Virgin Islands');
INSERT INTO COUNTRY (id, name) VALUES (240, 'Virgin Islands');
INSERT INTO COUNTRY (id, name) VALUES (241, 'Wallis and Futuna');
INSERT INTO COUNTRY (id, name) VALUES (242, 'Western Sahara');
INSERT INTO COUNTRY (id, name) VALUES (243, 'Yemen');
INSERT INTO COUNTRY (id, name) VALUES (244, 'Zambia');
INSERT INTO COUNTRY (id, name) VALUES (245, 'Zimbabwe');

#Users

#Grand master players 
INSERT INTO player(id, firstName, lastName, email, elo, countryId) VALUES (1,'Magnus', 'Carlsen' , 'mc@gmail.com', 3200, 3);
INSERT INTO player(id, firstName, lastName, email, elo, countryId) VALUES (2,'Hikaru', 'Nakamura' , 'hn@gmail.com', 3100, 5);
INSERT INTO player(id, firstName, lastName, email, elo, countryId) VALUES (3,'Garry', 'Kasparov' , 'gk@gmail.com', 2900, 4);
INSERT INTO player(id, firstName, lastName, email, elo, countryId) VALUES (4, 'Bobby', 'Fisher' , null, 2900, 5);
INSERT INTO player(id, firstName, lastName, email, elo, countryId) VALUES (5,'Boris', 'Spassky ' , null, 2900, 4);

#Normal players
INSERT INTO player(id, firstName, lastName, email, elo, countryId) VALUES (100,'Federico', 'Durso ' , "fd@gmail.com", 1500, 1);
INSERT INTO player(id, firstName, lastName, email, elo, countryId) VALUES (101,'Leandro', 'Ramella ' , "lr@gmail.com", 1000, 1);
INSERT INTO player(id, firstName, lastName, email, elo, countryId) VALUES (102,'Muhammad', 'Abadi' , "ma@gmail.com", 976, 1);

#MembershipType
INSERT INTO membershipType(id, name, description ,price  ) VALUES(1,'Gold', 'Gold', 29);
INSERT INTO membershipType(id, name, description,  price ) VALUES(2,'Platinum', 'Platinum', 49);
INSERT INTO membershipType(id, name, description, price ) VALUES(3,'Diamond', 'Diamond', 99);

#TypeOfMatch
insert into TypeOfMatch(id, name, label) values (1, 'Tournament', 'Tournament');

#resultType
INSERT INTO resultType(id, name, label, points) VALUES (1,'Defeated','Defeated', 0);
INSERT INTO resultType(id, name, label, points) VALUES (2,'Draw','Draw', 0.5);
INSERT INTO resultType(id, name, label, points) VALUES (3,'Winner','Winner', 1);
INSERT INTO matchGame(id, typeOfMatchId, datePlayed) VALUES (1, 1, '1972-8-31');

#playerMatchGame
INSERT INTO playerMatchGame (playerId, matchGameId, white, resultTypeId) VALUES (4,1,TRUE, 3);
INSERT INTO playerMatchGame (playerId, matchGameId, white, resultTypeId) VALUES (5,1,FALSE, 1);

#tournament
INSERT INTO tournament(id, name, year, countryId) VALUES(1, 'World Chess Championship 1972', 1972, 1 );

#tournamentPlayer
INSERT INTO tournamentPlayer(tournamentId, playerId, points, ranking) VALUES (1,4, 12.5,1);
INSERT INTO tournamentPlayer(tournamentId, playerId, points, ranking) VALUES (1,5, 8.5,2);

#tournamentMatch
INSERT INTO tournamentMatch(tournamentId, matchId) VALUES (1, 1);

 #Insert moves
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (1, 1, 1, 'e4', 'c5', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (2, 1, 2, 'Nf3', 'e6', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (3, 1, 3, 'd4', 'cxd4', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (4, 1, 4, 'Nxd4', 'a6', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (5, 1, 5, 'Nc3', 'Nc6', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (6, 1, 6, 'Be3', 'Nf6', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (7, 1, 7, 'Bd3', 'd5', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (8, 1, 8, 'exd5', 'exd5', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (9, 1, 9, '0-0', 'Bd6', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (10, 1, 10, 'Nxc6', 'bxc6', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (11, 1, 11, 'Bd4', '0-0', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (12, 1, 12, 'Qf3', 'Be6', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (13, 1, 13, 'Rfe1', 'c5', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (14, 1, 14, 'Bxf6', 'Qxf6', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (15, 1, 15, 'Qxf6', 'gxf6', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (16, 1, 16, 'Rad1', 'Rfd8', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (17, 1, 17, 'Be2', 'Rab8', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (18, 1, 18, 'b3', 'c4', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (19, 1, 19, 'Nxd5', 'Bxd5', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (20, 1, 20, 'Rxd5', 'Bxh2+', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (21, 1, 21, 'Kxh2', 'Rxd5', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (22, 1, 22, 'Bxc4', 'Rd2', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (23, 1, 23, 'Bxa6', 'Rxc2', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (24, 1, 24, 'Re2', 'Rxe2', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (25, 1, 25, 'Bxe2', 'Rd8', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (26, 1, 26, 'a4', 'Rd2', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (27, 1, 27, 'Bc4', 'Ra2', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (28, 1, 28, 'Kg3', 'Kf8', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (29, 1, 29, 'Kf3', 'Ke7', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (30, 1, 30, 'g4', 'f5', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (31, 1, 31, 'gxf5', 'f6', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (32, 1, 32, 'Bg8', 'h6', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (33, 1, 33, 'Kg3', 'Kd6', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (34, 1, 34, 'Kf3', 'Ra1', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (35, 1, 35, 'Kg2', 'Ke5', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (36, 1, 36, 'Be6', 'Kf4', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (37, 1, 37, 'Bd7', 'Rb1', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (38, 1, 38, 'Be6', 'Rb2', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (39, 1, 39, 'Bc4', 'Ra2', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (40, 1, 40, 'Be6', 'h5', null, null);
INSERT INTO chessgo.move (id, matchGameId, moveOrder, whiteMove, blackMove, whiteMoveTime, blackMoveTIme) VALUES (41, 1, 41, 'Bd7', null, null, null);

#Queries

#Retrieve users with membership expired on current year
SELECT      concat(p.firstName ,' ', p.lastName) as playerName,
			m.startDate,
            m.expirationDate
FROM		player p
			INNER JOIN membership m on m.playerId = p.id
WHERE 		YEAR(m.expirationDate) = YEAR(CURDATE()) 
		AND CURDATE() > m.expirationDate;    

#Retrieve users with membership close to expire within a range of 1 month
SELECT      concat(p.firstName ,' ', p.lastName) as playerName,
			m.expirationDate,
            DATEDIFF(CURDATE(), m.expirationDate) as daysToExpire
FROM		player p
			INNER JOIN membership m on m.playerId = p.id
WHERE 		YEAR(m.expirationDate) = YEAR(CURDATE()) 
		AND DATE_ADD( m.expirationDate, INTERVAL 1 MONTH) >= CURDATE() ;
        
#Retrieve profits from memberships for current year
SELECT  SUM(mt.price)
FROM	membership m
		INNER JOIN membershipType mt on mt.id = m.membershipTypeId
WHERE   YEAR(m.startDate) =  YEAR(CURDATE()) 
	AND  m.expirationDate > CURDATE();
        
#Retrieve profits by membership for current year
SELECT  mt.name as membershipType,
		SUM(mt.price) AS profit
FROM	membership m
		INNER JOIN membershipType mt on mt.id = m.membershipTypeId
WHERE   YEAR(m.startDate) =  YEAR(CURDATE()) 
	AND  m.expirationDate > CURDATE()
GROUP BY mt.name;    
    
#Retrieve yearly profits from tournaments for current year
SELECT      SUM(t.entryFee)
FROM    	tournament t
WHERE   	YEAR(t.startDate) =  YEAR(CURDATE());	

#Retrieve monthly profits from tournaments for current year
SELECT      MONTH(t.startDate),
			SUM(t.entryFee)
FROM    	tournament t
WHERE      YEAR(t.startDate) =  YEAR(CURDATE()) 
        AND t.entryFee > 0
GROUP BY	MONTH(t.startDate)        
ORDER BY    MONTH(t.startDate) ASC;  

#Retrieve average of yearly profits for the last 3 years
SELECT      YEAR(CURDATE())  AS year,
			SUM(t.entryFee)  AS Profit
FROM    	tournament t
WHERE   	YEAR(t.startDate) =  YEAR(CURDATE()) 		
        AND t.entryFee > 0
UNION         
SELECT      YEAR(date_sub( CURDATE(), INTERVAL 1 YEAR))  AS year,
			SUM(t.entryFee)  AS Profit
FROM    	tournament t
WHERE   	YEAR(t.startDate) =  YEAR(date_sub( CURDATE(), INTERVAL 1 YEAR))	
        AND t.entryFee > 0        
UNION         
SELECT      YEAR(date_sub( CURDATE(), INTERVAL 2 YEAR))  AS year,
			SUM(t.entryFee)  AS Profit
FROM    	tournament t
WHERE   	YEAR(t.startDate) =  YEAR(date_sub( CURDATE(), INTERVAL 2 YEAR))	
        AND t.entryFee > 0    
ORDER BY    year DESC;

#Retrieve global ranking    
SELECT      concat(p.firstName ,' ', p.lastName) as playerName ,
			c.name as Country,
            p.elo as eloRating,
			dense_rank() OVER (
				ORDER BY elo DESC
			) AS globalrank
FROM   		player p 
			INNER JOIN country c on c.id = p.countryId
ORDER BY	p.elo DESC;

#TODO: Add rank for a group of friends
