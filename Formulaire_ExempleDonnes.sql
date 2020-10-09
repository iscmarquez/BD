

-- ! Obtenir tous les programmes pour les afficher sur le formulaire

select idProgram, programDescription from program;
-- ! quand la personne demamnde enregistre le formulaire, on fait la r'ecuperation de l'id de faire l' insertion
-- ! select idProgram, programDescription from program;

-- ! Insert d' exemple de potential etudiant et ses programmes 
-- ! Il faut ajouter les suivantes lignes (comme dans l' exemple)
-- !  SET autocommit = OFF;
-- ! START TRANSACTION;
-- ! COMMIT;
-- ! pour eviter inserer dans un table et non dans la deuxieme
SET autocommit = OFF;
START TRANSACTION;
INSERT INTO `portesouvertsgrasset`.`inscription`(`mail`,`firstName`,`lastName`,`country`,`state`,`phone`,`moyenCommunication`,`consentMessage`,`date`)
VALUES("user2@gmail.com","Conrado","Bhering","Canada","Quebec","438 525-8453","web",1,now());

INSERT INTO `portesouvertsgrasset`.`interestingprogrammes`(`mail`,`idProgram`)
VALUES("user2@gmail.com",1);
INSERT INTO `portesouvertsgrasset`.`interestingprogrammes`(`mail`,`idProgram`)
VALUES("user2@gmail.com",430);


COMMIT;