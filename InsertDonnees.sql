USE `instit43_jpo_test_1.0`;
-- ! Insert des utilisateurs
INSERT INTO `user`(`username`,`email`,`password`,`rol`)
VALUES("Admin","admin@gmail.com","12345!","Administrateur");
INSERT INTO `user`(`username`,`email`,`password`,`rol`)
VALUES("Nicole Boyer","nicole@grasset.qc.ca","12345!","Clavardeur");
INSERT INTO `user`(`username`,`email`,`password`,`rol`)
VALUES("Admissions","catherine@grasset.qc.ca","12345!","Clavardeur");

-- ! Insert de la configuration 
INSERT INTO `configuration`(`linkVirtualVisit`,`linkFAQ`,`endMessage`,`noEvent`,`video1`,`video2`,`date`,`idUser`)
VALUES("https://www.institut-grasset.qc.ca/contactez-nous/","https://www.institut-grasset.qc.ca/contactez-nous/ ",
"Fin de l'événement des portes ouverts de l'institut Grasset",
"Aujourdh'ui il n' y a pas evenement", 
"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4xfuNWoZbW8\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>",
"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4xfuNWoZbW8\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>",
now(),
"admin@gmail.com");


-- ! Insert des programmes
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("AEC - Composition et effets spéciaux pour vidéo numérique NWY.16",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("AEC - Production télévisuelle et cinématographique NWY.15",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("AEC - Techniques de montage et d’habillage informatique NWY.00",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("AEC - Production multimédia, profil web et médias sociaux NWE.1A",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("AEC - Production 3D pour jeux vidéo NTL.12",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("AEC - Techniques d’animation 3D et effets spéciaux NTL.06",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("AEC – Spécialiste en réalité virtuelle et augmentée NTL.1K",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("AEC - Techniques d’inspection en bâtiment EEC.13",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("DEC - Techniques de l’informatique, profil programmation nouveaux médias 420.B0",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("DEC - Techniques de production et de postproduction télévisuelles 589.AB",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("DEC - Techniques d’animation 3D et de synthèse d’images 574.B0",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("DEC - Technologie de l’estimation et de l’évaluation en bâtiment spécialisation en évaluation immobilière 221.DB",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("DEC - Technologie de l’estimation et de l’évaluation en bâtiment",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("BIM - Technologie de l’estimation en construction BIM 5D",now(),"admin@gmail.com");
INSERT INTO `program`(`programDescription`,`date`,`idUser`)
VALUES("Je ne sais pas",now(),"admin@gmail.com");

-- ! Insert d'un événement de portes ouverts 
INSERT INTO `event`(`startDate`,`nomEvent`,`idUser`)
VALUES(now(),"Portes ouverts automme","admin@gmail.com");


-- ! Insert de brochures
INSERT INTO `downloadable`(`fileImage`,`fileLink`,`description`,`date`,`idUser`)
VALUES("\\images\images\dec1.jpg","\images\documents\fiche DECtechnique de production tv 589.AB.pdf","Brochure DEC en informatique",now(),"admin@gmail.com");
INSERT INTO `downloadable`(`fileImage`,`fileLink`,`description`,`date`,`idUser`)
VALUES("\\images\images\dec1.jpg","\images\documents\Fiche DECtechnique informatique 420.AA","Brochure DEC en informatique",now(),"admin@gmail.com");


-- ! Insert de speakers d'exemple 
INSERT INTO `speaker`(`name`,`description`,`chat`,`photoLink`,`linkchat`,`idUser`)
VALUES("Nicolas Garou","Cordinateur du programa d'Informatique",true,"lien du chat","\\images\speaker\image1.jpg","admin@gmail.com");
INSERT INTO `speaker`(`name`,`description`,`chat`,`photoLink`,`linkchat`,`idUser`)
VALUES("Laurence Goudin-Desphelippon","Enseignent du francais",true,"lien du chat","\\images\speaker\image2.jpg","admin@gmail.com");


-- ! Insert de conferences d'exemple
INSERT INTO `conference`(`nameConference`,`idEvent`,`start`,`end`,`idSpeaker`,`linkConference`,`date`,`idUser`)
VALUES("Intro DEC Informatique",1,"10:00", "11:00",1,"https://us04web.zoom.us/j/75020716883?pwd=QW14emdnZXlzUzZoOG1PYW50VDhIZz09",now(),"admin@gmail.com");
INSERT INTO `conference`(`nameConference`,`idEvent`,`start`,`end`,`idSpeaker`,`linkConference`,`date`,`idUser`)
VALUES("Information général",1,"11:00", "12:00",2,"https://us04web.zoom.us/j/75020716883?pwd=QW14emdnZXlzUzZoOG1PYW50VDhIZz09",now(),"admin@gmail.com");







