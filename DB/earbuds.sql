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
  `post_date` TIMESTAMP NOT NULL,
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

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `earbuds`;
INSERT INTO `location` (`id`, `city`, `state`, `country`) VALUES (1, 'Chicago', 'Illinois', 'United States');
INSERT INTO `location` (`id`, `city`, `state`, `country`) VALUES (2, 'Atlantis', 'Georgia', 'United States');
INSERT INTO `location` (`id`, `city`, `state`, `country`) VALUES (3, 'Essos', 'North Dakota', 'Essos');

COMMIT;


-- -----------------------------------------------------
-- Data for table `profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `earbuds`;
INSERT INTO `profile` (`id`, `user_id`, `image_link`, `first_name`, `last_name`, `location_id`) VALUES (1, 1, 'images/ProfilePic/DennisRod.jpg', 'Dennis', 'Rodman', 1);
INSERT INTO `profile` (`id`, `user_id`, `image_link`, `first_name`, `last_name`, `location_id`) VALUES (2, 2, 'images/ProfilePic/dreamy.png', 'Jason', 'Momoa', 2);
INSERT INTO `profile` (`id`, `user_id`, `image_link`, `first_name`, `last_name`, `location_id`) VALUES (3, 3, 'images/Profile/Pic/Daenerys.png', 'Daenerys', 'Targaryen', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `song`
-- -----------------------------------------------------
START TRANSACTION;
USE `earbuds`;
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (1, 'Africa', 'Toto IV', 'images/AlbumArt/Toto_IV.jpg', 'https://www.youtube.com/watch?v=FTQbiNvZqaY', 'Toto');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (2, 'Faith', 'Faith', 'images/AlbumArt/GeorgeMichael_Faith.jpg', 'https://www.youtube.com/watch?v=6Cs3Pvmmv0E', 'George Michael');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (3, 'Bohemian Rhapsody', 'A Night at the Opera', 'images/AlbumArt/Queen_ANightAtTheOpera.png', 'https://www.youtube.com/watch?v=fJ9rUzIMcZQ', 'Queen');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (4, 'Hit Me Baby One More Time', '...Baby One More Time', 'images/AlbumArt/_Baby_One_More_Time_(album).png', 'https://www.youtube.com/watch?v=C-u5WLJ9Yk4', 'Britney Spears');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (5, 'Beethoven Moonlight Sonata', 'Classical Piano Pieces', 'images/AlbumArt/GlennMorrison_Classical.jpeg', 'https://www.youtube.com/watch?v=H6nz1OW_wzE', 'Glen Morrison');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (6, 'Ziggy Stardust', 'The Rise and Fall of Ziggy Stardust and the Spiders From Mars', 'images/AlbumArt/DavidBowie_ZiggyStardust.jpg', 'https://www.youtube.com/watch?v=3qrOvBuWJ-c', 'David Bowie');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (7, 'Despacito', 'Single', 'images/AlbumArt/LuisFonsi.jpeg', 'https://www.youtube.com/watch?v=kJQP7kiw5Fk', 'Luis Fonsi');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (8, 'Cherokee', 'The Epic', 'images/AlbumArt/Kamasi_Washington_The_Epic.jpg', 'https://www.youtube.com/watch?v=3DM9fGXHhlk', 'Kamasi Washington');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (9, 'Hurt', 'American IV: The Man Comes Around', 'images/AlbumArt/JohnnyCash_AmericanIV.jpg', 'https://www.youtube.com/watch?v=FywSzjRq0e4', 'Johnny Cash');
INSERT INTO `song` (`id`, `title`, `album`, `album_image`, `url`, `artist`) VALUES (10, 'Juicy', 'Ready To Die', 'images/AlbumArt/BiggieSmalls_ReadyToDie.jpg', 'https://www.youtube.com/watch?v=KVQfWRl97jo', 'Biggie Smalls');

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

COMMIT;

