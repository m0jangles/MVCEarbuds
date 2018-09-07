-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema earbuds
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `earbuds` ;

-- -----------------------------------------------------
-- Schema earbuds
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `earbuds` DEFAULT CHARACTER SET utf8 ;
USE `earbuds` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profile` ;

CREATE TABLE IF NOT EXISTS `profile` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `image_link` VARCHAR(500) NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `location_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_user_idx` (`user_id` ASC),
  INDEX `fk_profile_location_idx` (`location_id` ASC),
  CONSTRAINT `fk_profile_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `song`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `song` ;

CREATE TABLE IF NOT EXISTS `song` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `album` VARCHAR(100) NOT NULL,
  `album_image` VARCHAR(500) NULL,
  `url` VARCHAR(500) NOT NULL,
  `artist` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `playlist` ;

CREATE TABLE IF NOT EXISTS `playlist` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `profile_id` INT UNSIGNED NOT NULL,
  `is_private` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_playlist_idx` (`profile_id` ASC),
  CONSTRAINT `fk_playlist`
    FOREIGN KEY (`profile_id`)
    REFERENCES `profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playlist_song`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `playlist_song` ;

CREATE TABLE IF NOT EXISTS `playlist_song` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `song_id` INT UNSIGNED NOT NULL,
  `playlist_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_song_playlist_song_idx` (`song_id` ASC),
  INDEX `fk_playlist_song_playlist_idx` (`playlist_id` ASC),
  CONSTRAINT `fk_song_playlist_song`
    FOREIGN KEY (`song_id`)
    REFERENCES `song` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_song_playlist`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `playlist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `song_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `song_post` ;

CREATE TABLE IF NOT EXISTS `song_post` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `profile_id` INT UNSIGNED NOT NULL,
  `song_id` INT UNSIGNED NOT NULL,
  `message` TEXT NULL,
  `post_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_song_post_idx` (`profile_id` ASC),
  INDEX `fk_song_post_song_idx` (`song_id` ASC),
  CONSTRAINT `fk_profile_song_post`
    FOREIGN KEY (`profile_id`)
    REFERENCES `profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_song_post_song`
    FOREIGN KEY (`song_id`)
    REFERENCES `song` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_friend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_friend` ;

CREATE TABLE IF NOT EXISTS `user_friend` (
  `user_id` INT UNSIGNED NOT NULL,
  `friend_id` INT UNSIGNED NOT NULL,
  INDEX `fk_user_friend_idx` (`friend_id` ASC),
  CONSTRAINT `fk_user_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_friend`
    FOREIGN KEY (`friend_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `song_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `song_genre` ;

CREATE TABLE IF NOT EXISTS `song_genre` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `song_id` INT UNSIGNED NOT NULL,
  `genre_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_song_song_genre_idx` (`song_id` ASC),
  INDEX `fk_genre_song_genre_idx` (`genre_id` ASC),
  CONSTRAINT `fk_song_song_genre`
    FOREIGN KEY (`song_id`)
    REFERENCES `song` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genre_song_genre`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS earbudsuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'earbudsuser'@'localhost' IDENTIFIED BY 'earbudsuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'earbudsuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `earbuds`;
INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES (1, 'DRodman', 'password', 'DRodman@aol.com');
INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES (2, 'KhalDrogo', 'aquaman', 'ImSoDreAmy@yahoo.com');
INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES (3, 'DragonQueen', 'dragonqueen', 'MotherODragons@msn.com');
INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES (4, 'TheRock', 'therock', 'WWE@hotmail.com');
INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES (5, 'NathalieP', 'password', 'nathalieP@gmail.com');
INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES (6, 'OGElectricCar', 'password', 'elon@gmail.com');
INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES (7, 'SpaceBook', 'password', 'TomA@myspace.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `earbuds`;
INSERT INTO `location` (`id`, `city`, `state`, `country`) VALUES (1, 'Chicago', 'Illinois', 'United States');
INSERT INTO `location` (`id`, `city`, `state`, `country`) VALUES (2, 'Atlantis', 'Georgia', 'United States');
INSERT INTO `location` (`id`, `city`, `state`, `country`) VALUES (3, 'Essos', 'North Dakota', 'Essos');
INSERT INTO `location` (`id`, `city`, `state`, `country`) VALUES (4, 'Denver', 'Colorado', 'United States');
INSERT INTO `location` (`id`, `city`, `state`, `country`) VALUES (5, 'San Francisco', 'California', 'United States');
INSERT INTO `location` (`id`, `city`, `state`, `country`) VALUES (6, 'Mobile', 'Alabama', 'United States');
INSERT INTO `location` (`id`, `city`, `state`, `country`) VALUES (7, 'Raleigh', 'North Carolina', 'United States');

COMMIT;


-- -----------------------------------------------------
-- Data for table `profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `earbuds`;
INSERT INTO `profile` (`id`, `user_id`, `image_link`, `first_name`, `last_name`, `location_id`) VALUES (1, 1, 'images/ProfilePic/DennisRod.jpg', 'Dennis', 'Rodman', 1);
INSERT INTO `profile` (`id`, `user_id`, `image_link`, `first_name`, `last_name`, `location_id`) VALUES (2, 2, 'images/ProfilePic/dreamy.png', 'Jason', 'Momoa', 2);
INSERT INTO `profile` (`id`, `user_id`, `image_link`, `first_name`, `last_name`, `location_id`) VALUES (3, 3, 'images/ProfilePic/Daenerys.png', 'Daenerys', 'Targaryen', 3);
INSERT INTO `profile` (`id`, `user_id`, `image_link`, `first_name`, `last_name`, `location_id`) VALUES (4, 4, 'images/ProfilePic/Dwayne.jpeg', 'Dwayne', 'Johnson', 4);
INSERT INTO `profile` (`id`, `user_id`, `image_link`, `first_name`, `last_name`, `location_id`) VALUES (5, 5, 'images/ProfilePic/Natalie.jpeg', 'Natalie ', 'Portman', 5);
INSERT INTO `profile` (`id`, `user_id`, `image_link`, `first_name`, `last_name`, `location_id`) VALUES (6, 6, 'images/ProfilePic/elon.jpeg', 'Elon', 'Musk', 6);
INSERT INTO `profile` (`id`, `user_id`, `image_link`, `first_name`, `last_name`, `location_id`) VALUES (7, 7, 'images/ProfilePic/tom.jpeg', 'Tom', 'Anderson', 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `song`
-- -----------------------------------------------------
START TRANSACTION;
USE `earbuds`;
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (1, 'Africa', 'Toto IV', 'images/AlbumArt/Toto_IV.jpg', 'FTQbiNvZqaY', 'Toto');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (2, 'Faith', 'Faith', 'images/AlbumArt/GeorgeMichael_Faith.jpg', '6Cs3Pvmmv0E', 'George Michael');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (3, 'Bohemian Rhapsody', 'A Night at the Opera', 'images/AlbumArt/Queen_ANightAtTheOpera.png', 'fJ9rUzIMcZQ', 'Queen');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (4, 'Hit Me Baby One More Time', '...Baby One More Time', 'images/AlbumArt/_Baby_One_More_Time_(album).png', 'C-u5WLJ9Yk4', 'Britney Spears');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (5, 'Beethoven Moonlight Sonata', 'Classical Piano Pieces', 'images/AlbumArt/GlennMorrison_Classical.jpeg', 'H6nz1OW_wzE', 'Glen Morrison');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (6, 'Ziggy Stardust', 'The Rise and Fall of Ziggy Stardust and the Spiders From Mars', 'images/AlbumArt/DavidBowie_ZiggyStardust.jpg', '3qrOvBuWJ-c', 'David Bowie');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (7, 'Despacito', 'Single', 'images/AlbumArt/LuisFonsi.jpeg', 'kJQP7kiw5Fk', 'Luis Fonsi');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (8, 'Cherokee', 'The Epic', 'images/AlbumArt/Kamasi_Washington_The_Epic.jpg', '3DM9fGXHhlk', 'Kamasi Washington');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (9, 'Hurt', 'American IV: The Man Comes Around', 'images/AlbumArt/JohnnyCash_AmericanIV.jpg', 'FywSzjRq0e4', 'Johnny Cash');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (10, 'Juicy', 'Ready To Die', 'images/AlbumArt/BiggieSmalls_ReadyToDie.jpg', 'KVQfWRl97jo', 'Biggie Smalls');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (11, 'Thriller', 'Thriller', 'images/AlbumArt/MJ_Thriller.jpeg', 'sOnqjkJTMaA', 'Michael Jackson');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (12, 'Mrs. Robinson', 'Simon & Garfunkal', 'images/AlbumArt/SG.jpeg', '9C1BCAgu2I8', 'Simon & Garfunkel');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (13, 'The Sound of Silence', 'Evolution', 'images/AlbumArt/Disturbed.jpeg', 'u9Dg-g7t2l4', 'Disturbed');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (14, 'Barbie Girl', 'Aquarium', 'images/AlbumArt/BarbieGirl.jpeg', 'ZyhrYis509A', 'Aqua');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (15, 'Wake Me Up', 'True', 'images/AlbumArt/Avicii.jpeg', 'IcrbM1l_BoI', 'Avicii');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (16, 'Proud Mary', 'Proud Mary: The Best of Ike & Tina Turner', 'images/AlbumArt/Tina.jpeg', 'hzQnPz6TpGc', 'Ike & Tina Turner');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (17, 'Wagon Wheel', 'Wagon Wheel', 'images/AlbumArt/Darius_Rucker.jpeg', 'hvKyBcCDOB4', 'Darius Rucker');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (18, 'Under Pressure', 'Hot Space', 'images/AlbumArt/Queen&DavidBowie', 'YoDh_gHDvkk', 'Queen & David Bowie');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (19, 'I Wanna Dance with Somebody', 'I Wanna Dance with Somebody', 'images/AlbumArt/Whitney.jpeg', 'zbLjJ6x2Hgs', 'Whitney Houston');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (20, 'Hey Jude', 'Hey Jude', 'images/AlbumArt/Beatles.jpeg', 'A_MjCqQoLLA', 'The Beatles');

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `earbuds`;
INSERT INTO `genre` (`id`, `name`) VALUES (1, 'Country');
INSERT INTO `genre` (`id`, `name`) VALUES (2, 'Rock');
INSERT INTO `genre` (`id`, `name`) VALUES (3, 'R&B');
INSERT INTO `genre` (`id`, `name`) VALUES (4, 'Jazz');
INSERT INTO `genre` (`id`, `name`) VALUES (5, 'Pop');
INSERT INTO `genre` (`id`, `name`) VALUES (6, 'Hip-Hop');
INSERT INTO `genre` (`id`, `name`) VALUES (7, 'Alternative Rock');
INSERT INTO `genre` (`id`, `name`) VALUES (8, 'Electronic Dance');
INSERT INTO `genre` (`id`, `name`) VALUES (9, 'Blues');
INSERT INTO `genre` (`id`, `name`) VALUES (10, 'Funk');
INSERT INTO `genre` (`id`, `name`) VALUES (11, 'Punk');
INSERT INTO `genre` (`id`, `name`) VALUES (12, 'Reggae');
INSERT INTO `genre` (`id`, `name`) VALUES (13, 'Metal');
INSERT INTO `genre` (`id`, `name`) VALUES (14, 'Folk');
INSERT INTO `genre` (`id`, `name`) VALUES (15, 'Heavy Metal');
INSERT INTO `genre` (`id`, `name`) VALUES (16, 'Techno');
INSERT INTO `genre` (`id`, `name`) VALUES (17 , 'Disco');
INSERT INTO `genre` (`id`, `name`) VALUES (18, 'Grunge');
INSERT INTO `genre` (`id`, `name`) VALUES (19, 'Progressive');
INSERT INTO `genre` (`id`, `name`) VALUES (20, 'Indie');
INSERT INTO `genre` (`id`, `name`) VALUES (21, 'Ambient');
INSERT INTO `genre` (`id`, `name`) VALUES (22, 'Soul');
INSERT INTO `genre` (`id`, `name`) VALUES (23, 'Classical');
INSERT INTO `genre` (`id`, `name`) VALUES (24, 'Rap');

COMMIT;


-- -----------------------------------------------------
-- Data for table `playlist`
-- -----------------------------------------------------
START TRANSACTION;
USE `earbuds`;
INSERT INTO `playlist` (`id`, `name`, `profile_id`, `is_private`) VALUES (1, 'Songs to Sing in the Shower', 2, 1);
INSERT INTO `playlist` (`id`, `name`, `profile_id`, `is_private`) VALUES (2, 'Gym', 1, 1);
INSERT INTO `playlist` (`id`, `name`, `profile_id`, `is_private`) VALUES (3, 'Motivation Nation', 3, 1);
INSERT INTO `playlist` (`id`, `name`, `profile_id`, `is_private`) VALUES (4, 'Songs to Sing in the Shower', 4, 1);
INSERT INTO `playlist` (`id`, `name`, `profile_id`, `is_private`) VALUES (5, 'Steve\'s Favorite Coding Jams', 5, 1);
INSERT INTO `playlist` (`id`, `name`, `profile_id`, `is_private`) VALUES (6, 'Rob\'s Songs to Program the House to', 6, 1);
INSERT INTO `playlist` (`id`, `name`, `profile_id`, `is_private`) VALUES (7, 'Andrew\'s Golfing Songs', 5, 1);
INSERT INTO `playlist` (`id`, `name`, `profile_id`, `is_private`) VALUES (8, 'Paul\'s Car Playlist', 1, 1);
INSERT INTO `playlist` (`id`, `name`, `profile_id`, `is_private`) VALUES (9, 'Denise\'s Songs to Get Jacked To', 3, 1);
INSERT INTO `playlist` (`id`, `name`, `profile_id`, `is_private`) VALUES (10, 'Songs for a Rainy Day', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `playlist_song`
-- -----------------------------------------------------
START TRANSACTION;
USE `earbuds`;
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (1, 1, 1);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (2, 2, 1);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (3, 3, 1);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (4, 4, 1);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (5, 5, 1);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (6, 6, 2);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (7, 7, 2);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (8, 8, 2);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (9, 9, 2);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (10, 10, 2);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (11, 11, 2);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (12, 12, 3);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (13, 13, 3);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (14, 14, 3);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (15, 15, 3);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (16, 16, 4);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (17, 17, 4);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (18, 18, 4);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (19, 18, 4);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (20, 19, 4);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (21, 20, 5);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (22, 9, 5);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (23, 8, 5);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (24, 1, 5);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (25, 5, 5);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (26, 8, 5);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (27, 9, 6);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (28, 2, 6);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (29, 11, 6);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (30, 2, 6);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (31, 17, 6);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (32, 20, 6);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (33, 7, 6);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (34, 9, 7);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (35, 12, 7);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (36, 13, 7);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (37, 14, 7);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (38, 15, 7);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (39, 19, 7);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (40, 3, 8);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (41, 2, 8);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (42, 1, 8);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (43, 11, 8);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (44, 20, 8);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (45, 5, 8);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (46, 4, 9);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (47, 12, 9);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (48, 9, 9);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (49, 11, 9);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (50, 13, 9);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (51, 14, 9);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (52, 4, 10);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (53, 3, 10);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (54, 13, 10);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (55, 15, 10);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (56, 18, 10);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (57, 19, 10);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (58, 8, 10);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (59, 10, 10);
INSERT INTO `playlist_song` (`id`, `song_id`, `playlist_id`) VALUES (60, 11, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `song_post`
-- -----------------------------------------------------
START TRANSACTION;
USE `earbuds`;
INSERT INTO `song_post` (`id`, `profile_id`, `song_id`, `message`, `post_date`) VALUES (1, 7, 7, 'This is my JAAAAM!!', '2018-09-06 00:00:00');
INSERT INTO `song_post` (`id`, `profile_id`, `song_id`, `message`, `post_date`) VALUES (2, 7, 8, 'I\'m so pumped for the new album!', '2018-09-06 00:00:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `song_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `earbuds`;
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (1, 1, 2);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (2, 1, 5);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (3, 2, 5);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (4, 3, 2);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (5, 4, 5);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (6, 5, 23);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (7, 6, 5);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (8, 7, 5);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (9, 7, 8);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (10, 8, 4);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (11, 9, 1);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (12, 10, 24);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (13, 11, 5);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (14, 12, 7);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (15, 13, 2);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (16, 14, 5);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (17, 15, 8);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (18, 16, 22);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (19, 17, 1);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (20, 18, 7);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (21, 19, 5);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (22, 20, 2);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (23, 16, 5);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (24, 17, 14);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (25, 12, 14);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (26, 12, 7);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (27, 13, 15);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (28, 13, 13);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (29, 14, 7);
INSERT INTO `song_genre` (`id`, `song_id`, `genre_id`) VALUES (30, 15, 5);

COMMIT;

