DROP TABLE CONTRACTE;
DROP TABLE ANGAJATI;
DROP TABLE JOBURI;
DROP TABLE STUDENTI;
DROP TABLE CAMERE;
DROP TABLE CLADIRI;
DROP TABLE CAMPUSURI;
DROP TABLE LOCATII;

CREATE TABLE LOCATII
(
  id_locatie INT constraint pk_locatie primary key,
  sector VARCHAR(20) constraint ch_sector check (len(sector)>1),
  cartier VARCHAR(20) constraint ch_cartier check (len(cartier)>1),
  cod_postal INT constraint nn_cod_postal NOT NULL
);

insert into LOCATII (id_locatie, sector, cartier, cod_postal) values(1,'Sectorul 1','Baneasa',013951);
insert into LOCATII (id_locatie, sector, cartier, cod_postal) values(2,'Sectorul 2','Pantilimon',021646);
insert into LOCATII (id_locatie, sector, cartier, cod_postal) values(3,'Sectorul 6','Militari',061083);

CREATE TABLE JOBURI
(
  id_job INT constraint pk_job primary key,
  denumire VARCHAR(30) constraint nn_denumire NOT NULL,
  salariul_minim NUMERIC(7,2) constraint nn_salariu_minim NOT NULL,
  salariul_maxim NUMERIC(7,2) constraint nn_salariu_maxim NOT NULL,
  constraint ch_salarii check (salariul_minim<salariul_maxim),
  constraint u_job UNIQUE(denumire)
);

insert into JOBURI (id_job,denumire,salariul_minim,salariul_maxim) values(1,'Administrator',3000,4000);
insert into JOBURI (id_job,denumire,salariul_minim,salariul_maxim) values(2,'Paznic',1000,2000);
insert into JOBURI (id_job,denumire,salariul_minim,salariul_maxim) values(3,'Bucatar',2500,3000);
insert into JOBURI (id_job,denumire,salariul_minim,salariul_maxim) values(4,'Menajer',1500,2500);
insert into JOBURI (id_job,denumire,salariul_minim,salariul_maxim) values(5,'Instalator',3000,3500);

CREATE TABLE CAMPUSURI
(
  id_campus INT constraint pk_campus primary key,
  denumire VARCHAR(30) constraint nn_denumire NOT NULL,
  id_locatie INT constraint nn_locatie NOT NULL,
  constraint f_locatie FOREIGN KEY (id_locatie) REFERENCES LOCATII(id_locatie) on delete cascade,
  constraint u_denumire UNIQUE(denumire),
  constraint ch_denumire check (len(denumire)>2)
);

insert into CAMPUSURI (id_campus, denumire, id_locatie) values (1,'Campus Stefan cel Mare',1);
insert into CAMPUSURI (id_campus, denumire, id_locatie) values (2,'Campus Pantilimon I',2);
insert into CAMPUSURI (id_campus, denumire, id_locatie) values (3,'Campus Dambovita',2);
insert into CAMPUSURI (id_campus, denumire, id_locatie) values (4,'Campus Leu',3);

CREATE TABLE CLADIRI
(
  id_cladire INT constraint pk_cladire primary key,
  nume VARCHAR(30) constraint nn_nume NOT NULL,
  nr_etaje INT ,
  id_campus INT constraint nn_campus NOT NULL,
  constraint f_campus FOREIGN KEY (id_campus) REFERENCES CAMPUSURI(id_campus) on delete cascade,
  constraint ch_nume check (len(nume)>2)
);

insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (1,'Camin A', 3, 1);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (2,'Camin B', 3, 1);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (3,'Facultatea de Energetica', 3, 1);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (4,'Cantina Stefan cel Mare', 2, 1);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (5,'Sala de sport Stefan cel Mare', 2, 1);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (6,'Camin A', 3, 2);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (7,'Camin B', 3, 2);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (8,'Facultatea de Transporturi', 3, 2);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (9,'Cantina Pantilimon', 2, 2);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (10,'Camin A', 4, 3);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (11,'Camin B', 4, 3);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (13,'Facultatea de Fizica', 3, 3);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (14,'Facultatea de Chimie', 3, 3);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (15,'Camin A', 4, 4);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (16,'Facultatea de Stiinte Aplicate', 3, 4);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (17,'Cantina Leu', 2, 4);
insert into CLADIRI (id_cladire, nume, nr_etaje, id_campus) values (18,'Amfiteatru Leu', 1, 4);

CREATE TABLE CAMERE
(
  id_camera INT constraint pk_camera primary key,
  numar_camera INT constraint nn_numar_camera NOT NULL,
  dimensiune NUMERIC(5,2) constraint nn_dimensiune NOT NULL,
  chirie NUMERIC(5,2) constraint nn_chirie NOT NULL,
  id_cladire INT constraint nn_cladire NOT NULL,
  constraint fk_cladire FOREIGN KEY (id_cladire) REFERENCES CLADIRI(id_cladire) on delete cascade,
  constraint ch_numar_camera check (len(numar_camera)>2)
);

insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (1, 101, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (2, 102, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (3, 103, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (4, 104, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (5, 105, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (6, 106, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (7, 107, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (8, 108, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (9, 109, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (10, 110, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (11, 201, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (12, 202, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (13, 203, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (14, 204, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (15, 205, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (16, 206, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (17, 207, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (18, 208, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (19, 209, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (20, 210, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (21, 301, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (22, 302, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (23, 303, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (24, 304, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (25, 305, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (26, 306, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (27, 307, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (28, 308, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (29, 309, 20.5, 300, 1);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (30, 310, 20.5, 300, 1);

insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (31, 101, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (32, 102, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (33, 103, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (34, 104, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (35, 105, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (36, 106, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (37, 107, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (38, 108, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (39, 109, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (40, 110, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (41, 201, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (42, 202, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (43, 203, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (44, 204, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (45, 205, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (46, 206, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (47, 207, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (48, 208, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (49, 209, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (50, 210, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (51, 301, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (52, 302, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (53, 303, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (54, 304, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (55, 305, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (56, 306, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (57, 307, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (58, 308, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (59, 309, 25.55, 350, 2);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (60, 310, 25.55, 350, 2);

insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (61, 101, 20.5, 300, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (62, 102, 20.5, 300, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (63, 103, 20.5, 300, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (64, 104, 20.5, 300, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (65, 105, 20.5, 300, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (66, 106, 20.5, 300, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (67, 107, 20.5, 300, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (68, 108, 20.5, 300, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (69, 109, 20.5, 300, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (70, 110, 20.5, 300, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (71, 201, 20.5, 300, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (72, 202, 20.5, 300, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (73, 203, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (74, 204, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (75, 205, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (76, 206, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (77, 207, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (78, 208, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (79, 209, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (80, 210, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (81, 301, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (82, 302, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (83, 303, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (84, 304, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (85, 305, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (86, 306, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (87, 307, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (88, 308, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (89, 309, 20, 250, 6);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (90, 309, 20, 250, 6);

insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (91, 101, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (92, 102, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (93, 103, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (94, 104, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (95, 105, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (96, 106, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (97, 107, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (98, 108, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (99, 201, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (100, 202, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (101, 203, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (102, 204, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (103, 205, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (104, 206, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (105, 207, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (106, 208, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (107, 201, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (108, 302, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (109, 303, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (110, 304, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (111, 305, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (112, 306, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (113, 307, 21.77, 260, 7);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (114, 308, 21.77, 260, 7);

insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (115, 101, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (116, 102, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (117, 103, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (118, 104, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (119, 105, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (120, 106, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (121, 107, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (122, 201, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (123, 202, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (124, 203, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (125, 204, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (126, 205, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (127, 206, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (128, 207, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (129, 301, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (130, 302, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (131, 303, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (132, 304, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (133, 305, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (134, 306, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (135, 307, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (136, 401, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (137, 402, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (138, 403, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (139, 404, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (140, 405, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (141, 406, 25.84, 290.60, 10);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (142, 407, 25.84, 290.60, 10);

insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (143, 101, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (144, 102, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (145, 103, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (146, 104, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (147, 105, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (148, 106, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (149, 107, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (150, 108, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (151, 201, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (152, 202, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (153, 203, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (154, 204, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (155, 205, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (156, 206, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (157, 207, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (158, 208, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (159, 301, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (160, 302, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (161, 303, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (162, 304, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (163, 305, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (164, 306, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (165, 307, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (166, 308, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (167, 401, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (168, 402, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (169, 403, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (170, 404, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (171, 405, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (172, 406, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (173, 407, 20.90, 288.80, 11);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (174, 408, 20.90, 288.80, 11);

insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (175, 101, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (176, 102, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (177, 103, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (178, 104, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (179, 105, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (180, 106, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (181, 107, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (182, 108, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (183, 109, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (184, 110, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (185, 201, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (186, 202, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (187, 203, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (188, 204, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (189, 205, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (190, 206, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (191, 207, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (192, 208, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (193, 209, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (194, 210, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (195, 301, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (196, 302, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (197, 303, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (198, 304, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (199, 305, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (200, 306, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (201, 307, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (202, 308, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (203, 309, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (204, 310, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (205, 401, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (206, 402, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (207, 403, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (208, 404, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (209, 405, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (210, 406, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (211, 407, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (212, 408, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (213, 409, 20.5, 300, 15);
insert into CAMERE (id_camera, numar_camera, dimensiune, chirie, id_cladire) values (214, 410, 20.5, 300, 15);

CREATE TABLE STUDENTI
(
  id_student INT constraint pk_student primary key,
  nume VARCHAR(30) constraint nn_nume NOT NULL,
  prenume VARCHAR(30) constraint nn_prenume NOT NULL,
  sex CHAR(2) constraint nn_sex NOT NULL,
  oras VARCHAR(30) constraint nn_oras NOT NULL,
  email VARCHAR(50) constraint u_email UNIQUE,
  nr_telefon CHAR(11) constraint nn_telefon NOT NULL,
  id_camera INT constraint nn_camera NOT NULL,
  constraint k_camera FOREIGN KEY (id_camera) REFERENCES CAMERE(id_camera) on delete cascade,
  constraint u_nr_telefon UNIQUE (nr_telefon),
  constraint ch_telefon check (len(nr_telefon)=10),
  constraint ch_sex check (sex = 'M' or sex = 'F') 
);

insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (1,'Anton', 'Gabriel', 'M', 'Sighisoara', 'AntonGabriel@gmail.com', '0724373063', 1);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (2,'Emilian', 'Marius', 'M', 'Ploiesti', 'EmilianMarius@gmail.com', '0724380856', 1);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (3,'Catarina', 'Iris', 'F', 'Bucuresti', 'CatarinaIris@gmail.com', '0724370721', 2);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (4,'Catarina', 'Nadia', 'F', 'Bucuresti', 'CatarinaNadia@gmail.com', '0724365836', 2);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (5,'Robert', 'Emilian', 'M', 'Bucuresti', 'RobertEmilian@gmail.com', '0724357796', 3);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (6,'Paul', 'Teodor', 'M', 'Braila', 'PaulTeodor@gmail.com', '0724371315', 3);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (7,'Blanca', 'Dora', 'F', 'Bucuresti', 'BlancaDora@gmail.com', '0724375620', 4);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (8,'Fabiana', 'Carisa', 'F', 'Constanta', 'FabianaCarisa@gmail.com', '0724373806', 4);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (9,'Raul', 'Gabriel', 'M', 'Bucuresti', 'RaulGabriel@gmail.com', '0724382597', 5);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (10,'Anton', 'David', 'M', 'Ploiesti', 'AntonDavid@gmail.com', '0724371567', 5);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (11,'Bela', 'Fabiana', 'F', 'Craiova', 'BelaFabiana@gmail.com', '0724360762', 6);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (12,'Dalia', 'Flavia', 'F', 'Deva', 'DaliaFlavia@gmail.com', '0724386651', 6);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (13,'Raul', 'Florin', 'M', 'Craiova', 'RaulFlorin@gmail.com', '0724381423', 7);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (14,'Dragos', 'Valentin', 'M', 'Rasnov', 'DragosValentin@gmail.com', '0724376084', 7);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (15,'Ania', 'Renata', 'F', 'Constanta', 'AniaRenata@gmail.com', '0724362836', 8);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (16,'Ania', 'Casiana', 'F', 'Constanta', 'AniaCasiana@gmail.com', '0724377699', 8);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (17,'Catarina', 'Rebeca', 'F', 'Ploiesti', 'CatarinaRebeca@gmail.com', '0724368900', 9);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (18,'Mabel', 'Edith', 'F', 'Predeal', 'MabelEdith@gmail.com', '0724373523', 9);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (19,'Lucian', 'Marius', 'M', 'Alexandria', 'LucianMarius@gmail.com', '0724365734', 10);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (20,'Cosmin', 'Octavian', 'M', 'Braila', 'CosminOctavian@gmail.com', '0724380202', 10);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (21,'Hortensia', 'Sonia', 'F', 'Campina', 'HortensiaSonia@gmail.com', '0724359431', 11);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (22,'Alisa', 'Miruna', 'F', 'Mangalia', 'AlisaMiruna@gmail.com', '0724376823', 11);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (23,'Alexandru', 'Anton', 'M', 'Bucuresti', 'AlexandruAnton@gmail.com', '0724383552', 12);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (24,'Iulian', 'Sorin', 'M', 'Campina', 'IulianSorin@gmail.com', '0724356200', 12);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (25,'Laurentiu', 'Ivan', 'M', 'Brasov', 'LaurentiuIvan@gmail.com', '0724380818', 13);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (26,'Adelin', 'George', 'M', 'Alexandria', 'AdelinGeorge@gmail.com', '0724380671', 13);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (27,'David', 'Daniel', 'M', 'Deva', 'DavidDaniel@gmail.com', '0724367184', 14);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (28,'David', 'Eduard', 'M', 'Bacau', 'DavidEduard@gmail.com', '0724378661', 14);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (29,'Marius', 'Cosmin', 'M', 'Brasov', 'MariusCosmin@gmail.com', '0724381244', 15);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (30,'Stefan', 'Pavel', 'M', 'Arad', 'StefanPavel@gmail.com', '0724367860', 15);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (31,'Amanda', 'Ramya', 'F', 'Bucuresti', 'AmandaRamya@gmail.com', '0724365231', 16);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (32,'Alma', 'Dora', 'F', 'Craiova', 'AlmaDora@gmail.com', '0724364277', 16);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (33,'Florin', 'Stefan', 'M', 'Arad', 'FlorinStefan@gmail.com', '0724378115', 17);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (34,'Robert', 'Laurentiu', 'M', 'Sighisoara', 'RobertLaurentiu@gmail.com', '0724381400', 17);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (35,'Mabel', 'Karina', 'F', 'Rasnov', 'MabelKarina@gmail.com', '0724386485', 18);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (36,'Casiana', 'Blanca', 'F', 'Brasov', 'CasianaBlanca@gmail.com', '0724360253', 18);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (37,'Iris', 'Hortensia', 'F', 'Constanta', 'IrisHortensia@gmail.com', '0724381489', 19);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (38,'Catarina', 'Miruna', 'F', 'Ploiesti', 'CatarinaMiruna@gmail.com', '0724364185', 19);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (39,'Miruna', 'Rebeca', 'F', 'Sighisoara', 'MirunaRebeca@gmail.com', '0724377915', 20);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (40,'Flavia', 'Gloria', 'F', 'Craiova', 'FlaviaGloria@gmail.com', '0724378378', 20);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (41,'Stefan', 'Octavian', 'M', 'Campulung', 'StefanOctavian@gmail.com', '0724380312', 21);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (42,'Andrei', 'Pavel', 'M', 'Mangalia', 'AndreiPavel@gmail.com', '0724372021', 21);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (43,'Iulian', 'Ovidiu', 'M', 'Sinaia', 'IulianOvidiu@gmail.com', '0724376377', 22);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (44,'George', 'Marius', 'M', 'Arad', 'GeorgeMarius@gmail.com', '0724360511', 22);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (45,'Dragos', 'Iulian', 'M', 'Campulung', 'DragosIulian@gmail.com', '0724372829', 23);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (46,'Eduard', 'Catalin', 'M', 'Campina', 'EduardCatalin@gmail.com', '0724370413', 23);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (47,'Edith', 'Miruna', 'F', 'Campulung', 'EdithMiruna@gmail.com', '0724364902', 24);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (48,'Flavia', 'Elvira', 'F', 'Brasov', 'FlaviaElvira@gmail.com', '0724386596', 24);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (49,'Catalin', 'Ivan', 'M', 'Galati', 'CatalinIvan@gmail.com', '0724384417', 25);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (50,'Liviu', 'Anton', 'M', 'Constanta', 'LiviuAnton@gmail.com', '0724361342', 25);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (51,'Francesca', 'Gloria', 'F', 'Rasnov', 'FrancescaGloria@gmail.com', '0724373690', 26);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (52,'Edith', 'Fabiana', 'F', 'Galati', 'EdithFabiana@gmail.com', '0724374692', 26);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (53,'Madalin', 'Ovidiu', 'M', 'Deva', 'MadalinOvidiu@gmail.com', '0724372432', 27);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (54,'Bogdan', 'Eduard', 'M', 'Constanta', 'BogdanEduard@gmail.com', '0724372084', 27);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (55,'Marius', 'Ivan', 'M', 'Campulung', 'MariusIvan@gmail.com', '0724376782', 28);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (56,'Lucian', 'Gabriel', 'M', 'Brasov', 'LucianGabriel@gmail.com', '0724356528', 28);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (57,'Hortensia', 'Rebeca', 'F', 'Alexandria', 'HortensiaRebeca@gmail.com', '0724380256', 29);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (58,'Gloria', 'Catarina', 'F', 'Sinaia', 'GloriaCatarina@gmail.com', '0724383763', 29);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (59,'Aris', 'Nadia', 'F', 'Campina', 'ArisNadia@gmail.com', '0724385892', 30);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (60,'Francesca', 'Leila', 'F', 'Predeal', 'FrancescaLeila@gmail.com', '0724359593', 30);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (61,'Robert', 'Sorin', 'M', 'Rasnov', 'RobertSorin@gmail.com', '0724358969', 31);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (62,'Ovidiu', 'Andrei', 'M', 'Botosani', 'OvidiuAndrei@gmail.com', '0724374897', 31);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (63,'Catalin', 'Paul', 'M', 'Mangalia', 'CatalinPaul@gmail.com', '0724363683', 32);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (64,'Octavian', 'Ovidiu', 'M', 'Craiova', 'OctavianOvidiu@gmail.com', '0724364479', 32);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (65,'Dora', 'Ania', 'F', 'Braila', 'DoraAnia@gmail.com', '0724382511', 33);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (66,'Dorina', 'Ania', 'F', 'Sighisoara', 'DorinaAnia@gmail.com', '0724358063', 33);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (67,'Iris', 'Karina', 'F', 'Bucuresti', 'IrisKarina@gmail.com', '0724385223', 34);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (68,'Ania', 'Nadia', 'F', 'Botosani', 'AniaNadia@gmail.com', '0724364449', 34);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (69,'Bela', 'Despina', 'F', 'Brasov', 'BelaDespina@gmail.com', '0724384039', 35);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (70,'Despina', 'Mabel', 'F', 'Botosani', 'DespinaMabel@gmail.com', '0724370033', 35);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (71,'Octavian', 'Catalin', 'M', 'Mangalia', 'OctavianCatalin@gmail.com', '0724366423', 36);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (72,'Madalin', 'Stefan', 'M', 'Galati', 'MadalinStefan@gmail.com', '0724366843', 36);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (73,'Raul', 'Dragos', 'M', 'Sibiu', 'RaulDragos@gmail.com', '0724382180', 37);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (74,'David', 'Laurentiu', 'M', 'Bacau', 'DavidLaurentiu@gmail.com', '0724366349', 37);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (75,'Alisa', 'Aris', 'F', 'Sibiu', 'AlisaAris@gmail.com', '0724374565', 38);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (76,'Karina', 'Fabiana', 'F', 'Campulung', 'KarinaFabiana@gmail.com', '0724378249', 38);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (77,'Madalin', 'Iulian', 'M', 'Constanta', 'MadalinIulian@gmail.com', '0724355726', 39);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (78,'Ivan', 'Iulian', 'M', 'Arad', 'IvanIulian@gmail.com', '0724382215', 39);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (79,'Miruna', 'Iris', 'F', 'Sighisoara', 'MirunaIris@gmail.com', '0724358038', 40);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (80,'Linda', 'Hortensia', 'F', 'Botosani', 'LindaHortensia@gmail.com', '0724356055', 40);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (81,'Andrei', 'Iulian', 'M', 'Sibiu', 'AndreiIulian@gmail.com', '0724365938', 41);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (82,'Raul', 'Sebastian', 'M', 'Bacau', 'RaulSebastian@gmail.com', '0724371147', 41);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (83,'Casiana', 'Ramya', 'F', 'Campina', 'CasianaRamya@gmail.com', '0724374543', 42);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (84,'Alisa', 'Linda', 'F', 'Sibiu', 'AlisaLinda@gmail.com', '0724381916', 42);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (85,'Alisa', 'Iris', 'F', 'Sinaia', 'AlisaIris@gmail.com', '0724371852', 43);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (86,'Nadia', 'Elia', 'F', 'Ploiesti', 'NadiaElia@gmail.com', '0724380371', 43);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (87,'Alisa', 'Rebeca', 'F', 'Rasnov', 'AlisaRebeca@gmail.com', '0724379768', 44);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (88,'Flavia', 'Elia', 'F', 'Bucuresti', 'FlaviaElia@gmail.com', '0724381964', 44);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (89,'David', 'Costin', 'M', 'Ploiesti', 'DavidCostin@gmail.com', '0724371667', 45);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (90,'Gabriel', 'Daniel', 'M', 'Bals', 'GabrielDaniel@gmail.com', '0724371086', 45);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (91,'Stefan', 'Sebastian', 'M', 'Constanta', 'StefanSebastian@gmail.com', '0724361521', 46);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (92,'Andrei', 'Florin', 'M', 'Bucuresti', 'AndreiFlorin@gmail.com', '0724356519', 46);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (93,'Bogdan', 'Robert', 'M', 'Arad', 'BogdanRobert@gmail.com', '0724366955', 47);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (94,'Catalin', 'Victor', 'M', 'Brasov', 'CatalinVictor@gmail.com', '0724371399', 47);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (95,'Catalin', 'Laurentiu', 'M', 'Bucuresti', 'CatalinLaurentiu@gmail.com', '0724354036', 48);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (96,'Cosmin', 'Stefan', 'M', 'Bacau', 'CosminStefan@gmail.com', '0724361794', 48);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (97,'Daniel', 'Bogdan', 'M', 'Predeal', 'DanielBogdan@gmail.com', '0724368164', 49);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (98,'Laurentiu', 'George', 'M', 'Moreni', 'LaurentiuGeorge@gmail.com', '0724373605', 49);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (99,'Eliza', 'Leila', 'F', 'Bals', 'ElizaLeila@gmail.com', '0724366444', 50);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (100,'Despina', 'Roberta', 'F', 'Constanta', 'DespinaRoberta@gmail.com', '0724375518', 50);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (101,'Florin', 'Victor', 'M', 'Alexandria', 'FlorinVictor@gmail.com', '0724376552', 51);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (102,'Stefan', 'Daniel', 'M', 'Galati', 'StefanDaniel@gmail.com', '0724358572', 51);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (103,'Eduard', 'Stefan', 'M', 'Campina', 'EduardStefan@gmail.com', '0724382358', 52);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (104,'Sorin', 'Pavel', 'M', 'Campina', 'SorinPavel@gmail.com', '0724371981', 52);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (105,'Blanca', 'Carisa', 'F', 'Deva', 'BlancaCarisa@gmail.com', '0724386064', 53);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (106,'Leila', 'Elvira', 'F', 'Braila', 'LeilaElvira@gmail.com', '0724365937', 53);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (107,'Linda', 'Eliza', 'F', 'Brasov', 'LindaEliza@gmail.com', '0724370980', 54);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (108,'Mabel', 'Dora', 'F', 'Craiova', 'MabelDora@gmail.com', '0724368368', 54);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (109,'Raul', 'Daniel', 'M', 'Sibiu', 'RaulDaniel@gmail.com', '0724379317', 55);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (110,'Daniel', 'Robert', 'M', 'Ploiesti', 'DanielRobert@gmail.com', '0724354017', 55);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (111,'Iris', 'Dalia', 'F', 'Predeal', 'IrisDalia@gmail.com', '0724386419', 56);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (112,'Eliza', 'Carla', 'F', 'Constanta', 'ElizaCarla@gmail.com', '0724362010', 56);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (113,'Blanca', 'Mabel', 'F', 'Moreni', 'BlancaMabel@gmail.com', '0724360305', 57);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (114,'Dalia', 'Despina', 'F', 'Craiova', 'DaliaDespina@gmail.com', '0724383684', 57);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (115,'Despina', 'Ania', 'F', 'Brasov', 'DespinaAnia@gmail.com', '0724374745', 58);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (116,'Blanca', 'Blanca', 'F', 'Galati', 'BlancaBlanca@gmail.com', '0724371607', 58);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (117,'Casiana', 'Dalia', 'F', 'Brasov', 'CasianaDalia@gmail.com', '0724365371', 59);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (118,'Eliza', 'Elvira', 'F', 'Constanta', 'ElizaElvira@gmail.com', '0724356197', 59);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (119,'Mabel', 'Elvira', 'F', 'Mangalia', 'MabelElvira@gmail.com', '0724359002', 60);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (120,'Iris', 'Amanda', 'F', 'Moreni', 'IrisAmanda@gmail.com', '0724376744', 60);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (121,'Linda', 'Iolanda', 'F', 'Galati', 'LindaIolanda@gmail.com', '0724373299', 61);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (122,'Despina', 'Edith', 'F', 'Bals', 'DespinaEdith@gmail.com', '0724366729', 61);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (123,'Iolanda', 'Dora', 'F', 'Bacau', 'IolandaDora@gmail.com', '0724368379', 62);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (124,'Despina', 'Miruna', 'F', 'Braila', 'DespinaMiruna@gmail.com', '0724363251', 62);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (125,'Dora', 'Elia', 'F', 'Craiova', 'DoraElia@gmail.com', '0724377763', 63);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (126,'Elvira', 'Karina', 'F', 'Botosani', 'ElviraKarina@gmail.com', '0724383511', 63);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (127,'Dora', 'Ramya', 'F', 'Rasnov', 'DoraRamya@gmail.com', '0724377935', 64);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (128,'Carisa', 'Hortensia', 'F', 'Predeal', 'CarisaHortensia@gmail.com', '0724358459', 64);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (129,'Bogdan', 'Paul', 'M', 'Constanta', 'BogdanPaul@gmail.com', '0724365947', 65);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (130,'Andrei', 'Laurentiu', 'M', 'Sighisoara', 'AndreiLaurentiu@gmail.com', '0724360548', 65);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (131,'Elvira', 'Rebeca', 'F', 'Bals', 'ElviraRebeca@gmail.com', '0724356857', 66);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (132,'Elia', 'Sonia', 'F', 'Sibiu', 'EliaSonia@gmail.com', '0724365529', 66);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (133,'Adelin', 'Laurentiu', 'M', 'Craiova', 'AdelinLaurentiu@gmail.com', '0724356117', 67);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (134,'Stefan', 'Florin', 'M', 'Ploiesti', 'StefanFlorin@gmail.com', '0724376635', 67);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (135,'Liviu', 'Sebastian', 'M', 'Brasov', 'LiviuSebastian@gmail.com', '0724371764', 68);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (136,'Pavel', 'Catalin', 'M', 'Deva', 'PavelCatalin@gmail.com', '0724385677', 68);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (137,'Gloria', 'Elia', 'F', 'Moreni', 'GloriaElia@gmail.com', '0724366087', 69);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (138,'Miruna', 'Casiana', 'F', 'Campulung', 'MirunaCasiana@gmail.com', '0724359450', 69);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (139,'Adelin', 'Daniel', 'M', 'Campulung', 'AdelinDaniel@gmail.com', '0724364442', 70);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (140,'David', 'Eduard', 'M', 'Mangalia', 'DavidEduard@yahoo.com', '0724370535', 70);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (143,'Daniel', 'Daniel', 'M', 'Arad', 'DanielDaniel@gmail.com', '0724363207', 72);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (144,'Eduard', 'Emilian', 'M', 'Campina', 'EduardEmilian@gmail.com', '0724354504', 72);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (145,'Lucian', 'Sebastian', 'M', 'Rasnov', 'LucianSebastian@gmail.com', '0724367063', 73);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (146,'Octavian', 'Andrei', 'M', 'Sighisoara', 'OctavianAndrei@gmail.com', '0724382579', 73);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (147,'Catarina', 'Rebeca', 'F', 'Moreni', 'CatarinaRebeca@yahoo.com', '0724369039', 74);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (148,'Iris', 'Nadia', 'F', 'Sighisoara', 'IrisNadia@gmail.com', '0724380634', 74);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (149,'Karina', 'Fabiane', 'F', 'Brasov', 'KarinaFabiana@yahoo.com', '0724365086', 75);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (150,'Gratiela', 'Gratiela', 'F', 'Campina', 'GratielaGratiela@gmail.com', '0724382397', 75);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (151,'Sorin', 'Teodor', 'M', 'Ploiesti', 'SorinTeodor@gmail.com', '0724359891', 76);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (152,'Florin', 'Paul', 'M', 'Constanta', 'FlorinPaul@gmail.com', '0724385521', 76);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (153,'Catalin', 'Bogdan', 'M', 'Moreni', 'CatalinBogdan@gmail.com', '0724381707', 77);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (154,'Marius', 'Florinel', 'M', 'Campulung', 'MariusFlorinel@gmail.com', '0724374109', 77);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (155,'Madalin', 'Marius', 'M', 'Deva', 'MadalinMarius@gmail.com', '0724359495', 78);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (156,'Adelin', 'Dragos', 'M', 'Bucuresti', 'AdelinDragos@gmail.com', '0724380322', 78);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (157,'Lucian', 'Gabi', 'M', 'Sinaia', 'LucianGabi@gmail.com', '0724369392', 79);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (158,'Dragos', 'Madalin', 'M', 'Predeal', 'DragosMadalin@gmail.com', '0724386498', 79);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (159,'Catalin', 'Cosmin', 'M', 'Bals', 'CatalinCosmin@gmail.com', '0724356257', 80);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (160,'Laurentiu', 'Georgel', 'M', 'Predeal', 'LaurentiuGeorgel@yahoo.com', '0724372134', 80);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (161,'Blanca', 'Dorela', 'F', 'Bucuresti', 'BlancaDorela@yahoo.com', '0724361485', 81);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (162,'Eliza', 'Rebeca', 'F', 'Braila', 'ElizaRebeca@gmail.com', '0724354644', 81);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (163,'George', 'Dan', 'M', 'Sinaia', 'GeorgeDan@gmail.com', '0724365316', 82);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (164,'Dragos', 'Laurentiu', 'M', 'Brasov', 'DragosLaurentiu@gmail.com', '0724367542', 82);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (165,'Daniel', 'Ivan', 'M', 'Craiova', 'DanielIvan@gmail.com', '0724375439', 83);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (166,'Daniel', 'Lucian', 'M', 'Deva', 'DanielLucian@gmail.com', '0724355663', 83);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (167,'Carisa', 'Elvira', 'F', 'Moreni', 'CarisaElvira@gmail.com', '0724369838', 84);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (168,'Elvira', 'Leila', 'F', 'Ploiesti', 'ElviraLeila@gmail.com', '0724379402', 84);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (169,'Miruna', 'Dora', 'F', 'Campulung', 'MirunaDora@gmail.com', '0724375026', 85);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (170,'Iolanda', 'Carisa', 'F', 'Botosani', 'IolandaCarisa@gmail.com', '0724382464', 85);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (171,'Florin', 'Madalin', 'M', 'Campulung', 'FlorinMadalin@gmail.com', '0724357421', 86);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (172,'Iulian', 'Sorinel', 'M', 'Sibiu', 'IulianSorinel@yahoo.com', '0724359459', 86);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (173,'Carisa', 'Rebeca', 'F', 'Bals', 'CarisaRebeca@gmail.com', '0724356837', 87);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (174,'Mabel', 'Elia', 'F', 'Galati', 'MabelElia@gmail.com', '0724358943', 87);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (175,'Lucian', 'Adelin', 'M', 'Deva', 'LucianAdelin@gmail.com', '0724385954', 88);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (176,'Catalin', 'Dragos', 'M', 'Sighisoara', 'CatalinDragos@gmail.com', '0724374782', 88);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (177,'Francesca', 'Sonia', 'F', 'Bucuresti', 'FrancescaSonia@gmail.com', '0724375324', 89);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (178,'Flavia', 'Dalia', 'F', 'Alexandria', 'FlaviaDalia@gmail.com', '0724358430', 89);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (179,'Liviu', 'Octavian', 'M', 'Rasnov', 'LiviuOctavian@gmail.com', '0724360932', 90);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (180,'Sebastian', 'Gabriel', 'M', 'Sinaia', 'SebastianGabriel@gmail.com', '0724369642', 90);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (181,'Sorin', 'Robert', 'M', 'Brasov', 'SorinRobert@gmail.com', '0724358838', 91);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (182,'Eduard', 'Daniel', 'M', 'Sighisoara', 'EduardDaniel@gmail.com', '0724379305', 91);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (183,'Anton', 'George', 'M', 'Bals', 'AntonGeorge@gmail.com', '0724363390', 92);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (184,'Ovidiu', 'Robert', 'M', 'Craiova', 'OvidiuRobert@gmail.com', '0724377236', 92);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (187,'Lucian', 'Stefan', 'M', 'Predeal', 'LucianStefan@gmail.com', '0724383706', 94);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (189,'Gratiela', 'Linda', 'F', 'Mangalia', 'GratielaLinda@gmail.com', '0724362150', 95);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (190,'Linda', 'Flavia', 'F', 'Alexandria', 'LindaFlavia@gmail.com', '0724374376', 95);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (191,'Octavian', 'Robert', 'M', 'Campulung', 'OctavianRobert@gmail.com', '0724371735', 96);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (192,'Alexandru', 'Valentin', 'M', 'Campulung', 'AlexandruValentin@gmail.com', '0724358080', 96);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (193,'Francesca', 'Despina', 'F', 'Campina', 'FrancescaDespina@gmail.com', '0724364787', 97);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (194,'Elvira', 'Ania', 'F', 'Constanta', 'ElviraAnia@gmail.com', '0724367902', 97);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (195,'Iris', 'Alma', 'F', 'Sighisoara', 'IrisAlma@gmail.com', '0724370528', 98);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (196,'Nadia', 'Renata', 'F', 'Alexandria', 'NadiaRenata@gmail.com', '0724365018', 98);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (197,'Madalin', 'Emilian', 'M', 'Brasov', 'MadalinEmilian@gmail.com', '0724383094', 99);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (198,'Ovidiu', 'Ovidiu', 'M', 'Alexandria', 'OvidiuOvidiu@gmail.com', '0724377944', 99);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (199,'Alexandru', 'David', 'M', 'Rasnov', 'AlexandruDavid@gmail.com', '0724357570', 100);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (200,'Eduard', 'Cosmin', 'M', 'Bals', 'EduardCosmin@gmail.com', '0724357455', 100);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (201,'Lucian', 'Eduard', 'M', 'Braila', 'LucianEduard@gmail.com', '0724384568', 101);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (202,'Emilian', 'Costin', 'M', 'Deva', 'EmilianCostin@gmail.com', '0724357725', 101);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (203,'Cosmin', 'Daniel', 'M', 'Sibiu', 'CosminDaniel@gmail.com', '0724376513', 102);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (204,'Anton', 'Liviu', 'M', 'Predeal', 'AntonLiviu@gmail.com', '0724363675', 102);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (205,'Carla', 'Bela', 'F', 'Moreni', 'CarlaBela@gmail.com', '0724360592', 103);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (206,'Gratiela', 'Casiana', 'F', 'Braila', 'GratielaCasiana@gmail.com', '0724372931', 103);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (207,'Bela', 'Blanca', 'F', 'Campina', 'BelaBlanca@gmail.com', '0724363855', 104);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (208,'Hortensia', 'Ramya', 'F', 'Bals', 'HortensiaRamya@gmail.com', '0724379163', 104);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (209,'Catalin', 'Teodor', 'M', 'Mangalia', 'CatalinTeodor@gmail.com', '0724367865', 105);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (210,'Ovidiu', 'Raul', 'M', 'Bals', 'OvidiuRaul@gmail.com', '0724378449', 105);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (211,'Pavel', 'Andrei', 'M', 'Bals', 'PavelAndrei@gmail.com', '0724383182', 106);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (212,'Laurentiu', 'Eduard', 'M', 'Rasnov', 'LaurentiuEduard@gmail.com', '0724374604', 106);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (213,'Blanca', 'Hortensia', 'F', 'Sighisoara', 'BlancaHortensia@gmail.com', '0724379845', 107);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (214,'Dora', 'Carisa', 'F', 'Campulung', 'DoraCarisa@gmail.com', '0724371004', 107);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (215,'Alma', 'Sonia', 'F', 'Rasnov', 'AlmaSonia@gmail.com', '0724372026', 108);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (216,'Aris', 'Carisa', 'F', 'Arad', 'ArisCarisa@gmail.com', '0724363902', 108);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (217,'Gabriel', 'Costin', 'M', 'Bucuresti', 'GabrielCostin@gmail.com', '0724353922', 109);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (218,'Adeli', 'Laurentiu', 'M', 'Braila', 'AdeliLaurentiu@gyahoo.com', '0724358965', 109);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (219,'Marius', 'David', 'M', 'Moreni', 'MariusDavid@gmail.com', '0724376761', 110);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (220,'David', 'Lucian', 'M', 'Predeal', 'DavidLucian@gmail.com', '0724374719', 110);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (221,'Dora', 'Edith', 'F', 'Braila', 'DoraEdith@gmail.com', '0724357203', 111);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (222,'Gratiela', 'Gloria', 'F', 'Alexandria', 'GratielaGloria@gmail.com', '0724364010', 111);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (223,'Eduard', 'Anton', 'M', 'Constanta', 'EduardAnton@gmail.com', '0724361758', 112);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (224,'Florin', 'Dragos', 'M', 'Arad', 'FlorinDragos@gmail.com', '0724360710', 112);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (225,'Edith', 'Elvira', 'F', 'Alexandria', 'EdithElvira@gmail.com', '0724381575', 113);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (226,'Linda', 'Ioli', 'F', 'Sighisoara', 'LindaIoli@yahoo.com', '0724359915', 113);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (227,'Alma', 'Dalia', 'F', 'Mangalia', 'AlmaDalia@gmail.com', '0724374309', 114);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (228,'Edith', 'Iolanda', 'F', 'Sibiu', 'EdithIolanda@gmail.com', '0724377835', 114);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (229,'Laurentiu', 'Liviu', 'M', 'Sinaia', 'LaurentiuLiviu@gmail.com', '0724358700', 115);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (230,'Emilian', 'Iulian', 'M', 'Deva', 'EmilianIulian@gmail.com', '0724385801', 115);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (231,'Paul', 'Daniel', 'M', 'Alexandria', 'PaulDaniel@gmail.com', '0724380524', 116);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (232,'Laurentiu', 'Marian', 'M', 'Galati', 'LaurentiuMarian@gmail.com', '0724377450', 116);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (233,'Dora', 'Blanca', 'F', 'Constanta', 'DoraBlanca@gmail.com', '0724354948', 117);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (234,'Alma', 'Flavia', 'F', 'Deva', 'AlmaFlavia@gmail.com', '0724361385', 117);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (235,'Dalia', 'Hortensia', 'F', 'Rasnov', 'DaliaHortensia@gmail.com', '0724361852', 118);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (236,'Francesca', 'Amanda', 'F', 'Botosani', 'FrancescaAmanda@gmail.com', '0724354946', 118);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (237,'Octavian', 'Florin', 'M', 'Alexandria', 'OctavianFlorin@gmail.com', '0724381812', 119);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (238,'Laurentiu', 'Daniel', 'M', 'Moreni', 'LaurentiuDaniel@gmail.com', '0724382380', 119);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (239,'Blanca', 'Rebeca', 'F', 'Galati', 'BlancaRebeca@gmail.com', '0724365916', 120);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (240,'Karina', 'Amanda', 'F', 'Alexandria', 'KarinaAmanda@gmail.com', '0724357819', 120);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (241,'Laurentiu', 'Raul', 'M', 'Bacau', 'LaurentiuRaul@gmail.com', '0724357992', 121);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (242,'Marius', 'Daniel', 'M', 'Constanta', 'MariusDaniel@gmail.com', '0724361172', 121);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (243,'Iulian', 'Emilian', 'M', 'Constanta', 'IulianEmilian@gmail.com', '0724354434', 122);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (244,'Raul', 'Marius', 'M', 'Sinaia', 'RaulMarius@gmail.com', '0724363461', 122);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (245,'Mabel', 'Hortensia', 'F', 'Bacau', 'MabelHortensia@gmail.com', '0724379722', 123);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (246,'Leila', 'Iolanda', 'F', 'Sighisoara', 'LeilaIolanda@gmail.com', '0724358343', 123);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (247,'Laurentiu', 'Dragos', 'M', 'Campulung', 'LaurentiuDragos@gmail.com', '0724364834', 124);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (248,'Ovidiu', 'Cosmin', 'M', 'Craiova', 'OvidiuCosmin@gmail.com', '0724355549', 124);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (249,'Ovidiu', 'Marius', 'M', 'Campulung', 'OvidiuM@yahoo.com', '0724370292', 125);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (250,'Dragos', 'Bogdan', 'M', 'Bacau', 'DragosBogdan@gmail.com', '0724375082', 125);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (251,'Stefan', 'Raul', 'M', 'Campulung', 'StefanRaul@gmail.com', '0724378409', 126);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (252,'Alexandru', 'Vladut', 'M', 'Galati', 'AlexandruVladut@gmail.com', '0724374422', 126);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (253,'Karina', 'Alisa', 'F', 'Bals', 'KarinaAlisa@gmail.com', '0724373451', 127);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (254,'Alisa', 'Casiana', 'F', 'Moreni', 'AlisaCasiana@gmail.com', '0724366443', 127);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (255,'Dragos', 'Andrei', 'M', 'Arad', 'DragosAndrei@gmail.com', '0724368227', 128);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (256,'Florin', 'George', 'M', 'Sighisoara', 'FlorinGeorge@gmail.com', '0724370230', 128);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (260,'Ovidiu', 'Victor', 'M', 'Botosani', 'OvidiuVictor@gmail.com', '0724384462', 130);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (261,'Florin', 'Liviu', 'M', 'Alexandria', 'FlorinLiviu@gmail.com', '0724382546', 131);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (262,'Andrei', 'Adelin', 'M', 'Sighisoara', 'AndreiAdelin@gmail.com', '0724382290', 131);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (263,'Catarina', 'Linda', 'F', 'Constanta', 'CatarinaLinda@gmail.com', '0724372713', 132);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (264,'Elia', 'Amanda', 'F', 'Bucuresti', 'EliaAmanda@gmail.com', '0724374183', 132);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (265,'Sebastian', 'Octavian', 'M', 'Sinaia', 'SebastianOctavian@gmail.com', '0724370110', 133);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (266,'Pavel', 'Paul', 'M', 'Campulung', 'PavelPaul@gmail.com', '0724364958', 133);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (267,'Mabel', 'Fabiana', 'F', 'Mangalia', 'MabelFabiana@gmail.com', '0724384194', 134);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (268,'Elia', 'Catarina', 'F', 'Bals', 'EliaCatarina@gmail.com', '0724367055', 134);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (269,'Eliza', 'Alma', 'F', 'Deva', 'ElizaAlma@gmail.com', '0724380162', 135);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (270,'Ali', 'Casiana', 'F', 'Sighisoara', 'AliCasiana@yahoo.com', '0724384668', 135);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (271,'Stefan', 'Andrei', 'M', 'Deva', 'StefanAndrei@gmail.com', '0724379285', 136);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (272,'Costin', 'Adelin', 'M', 'Alexandria', 'CostinAdelin@gmail.com', '0724355258', 136);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (273,'Nadia', 'Francesca', 'F', 'Ploiesti', 'NadiaFrancesca@gmail.com', '0724360866', 137);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (274,'Bela', 'Dalia', 'F', 'Campina', 'BelaDalia@gmail.com', '0724375471', 137);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (275,'Catalin', 'Cosminus', 'M', 'Craiova', 'CatalinCosminus@gmail.com', '0724361844', 138);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (276,'Octavian', 'Eduard', 'M', 'Braila', 'OctavianEduard@gmail.com', '0724354906', 138);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (277,'Elia', 'Gloria', 'F', 'Campina', 'EliaGloria@gmail.com', '0724363656', 139);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (278,'Elia', 'Carisa', 'F', 'Constanta', 'EliaCarisa@gmail.com', '0724355802', 139);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (281,'Despina', 'Gloria', 'F', 'Moreni', 'DespinaGloria@gmail.com', '0724375681', 141);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (282,'Flavia', 'Aris', 'F', 'Sighisoara', 'FlaviaAris@gmail.com', '0724357341', 141);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (283,'Eduard', 'Valentin', 'M', 'Sighisoara', 'EduardValentin@gmail.com', '0724356270', 142);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (284,'Costin', 'Sorin', 'M', 'Sighisoara', 'CostinSorin@gmail.com', '0724371876', 142);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (285,'Iolanda', 'Leila', 'F', 'Bacau', 'IolandaLeila@gmail.com', '0724386076', 143);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (286,'Eliza', 'Ramya', 'F', 'Sighisoara', 'ElizaRamya@gmail.com', '0724358218', 143);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (287,'Mabele', 'Eli', 'F', 'Sibiu', 'MabeleEli@yahoo.com', '0724361428', 144);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (288,'Mabel', 'Gloria', 'F', 'Campina', 'MabelGloria@gmail.com', '0724375885', 144);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (289,'Carisa', 'Dora', 'F', 'Sighisoara', 'CarisaDora@gmail.com', '0724383320', 145);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (290,'Narcisa', 'Francesca', 'F', 'Brasov', 'NarcisaFrancesca@gmail.com', '0724372597', 145);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (291,'Iulian', 'Daniel', 'M', 'Arad', 'IulianDaniel@gmail.com', '0724361079', 146);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (292,'Stefan', 'Valentin', 'M', 'Moreni', 'StefanValentin@gmail.com', '0724375207', 146);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (293,'Laurentiu', 'Madalin', 'M', 'Botosani', 'LaurentiuMadalin@gmail.com', '0724377544', 147);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (294,'Madalin', 'Dragos', 'M', 'Ploiesti', 'MadalinDragos@gmail.com', '0724369763', 147);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (295,'David', 'Catalin', 'M', 'Brasov', 'DavidCatalin@gmail.com', '0724373687', 148);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (296,'Dragos', 'Victor', 'M', 'Rasnov', 'DragosVictor@gmail.com', '0724376724', 148);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (297,'Pavel', 'Costin', 'M', 'Bucuresti', 'PavelCostin@gmail.com', '0724379664', 149);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (298,'Stefan', 'Florentin', 'M', 'Sighisoara', 'StefanFlorentin@gmail.com', '0724370484', 149);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (299,'Sebastian', 'Sorin', 'M', 'Moreni', 'SebastianSorin@gmail.com', '0724370489', 150);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (300,'David', 'Victor', 'M', 'Predeal', 'DavidVictor@gmail.com', '0724385204', 150);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (301,'Francesca', 'Iris', 'F', 'Braila', 'FrancescaIris@gmail.com', '0724355564', 151);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (302,'Eliza', 'Eliza', 'F', 'Sibiu', 'ElizaEliza@gmail.com', '0724361107', 151);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (303,'Hortensia', 'Blanca', 'F', 'Deva', 'HortensiaBlanca@gmail.com', '0724362504', 152);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (304,'Iolanda', 'Aris', 'F', 'Alexandria', 'IolandaAris@gmail.com', '0724359735', 152);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (305,'Elia', 'Dora', 'F', 'Predeal', 'EliaDora@gmail.com', '0724364832', 153);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (306,'Iris', 'Karinela', 'F', 'Predeal', 'IrisKarinel@yahoo.com', '0724382508', 153);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (307,'Casiana', 'Ramyzal', 'F', 'Sinaia', 'CasianaRamyzal@yahoo.com', '0724386650', 154);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (308,'Carisa', 'Ramya', 'F', 'Ploiesti', 'CarisaRamya@gmail.com', '0724373329', 154);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (309,'Eduard', 'Laurentiu', 'M', 'Rasnov', 'EduardLaurentiu@gmail.com', '0724361727', 155);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (310,'Daniel', 'Laurentiu', 'M', 'Sighisoara', 'DanielLaurentiu@gmail.com', '0724362822', 155);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (311,'Elvira', 'Alisa', 'F', 'Mangalia', 'ElviraAlisa@gmail.com', '0724355629', 156);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (312,'Alisa', 'Fabiana', 'F', 'Brasov', 'AlisaFabiana@gmail.com', '0724375786', 156);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (313,'Ania', 'Carisa', 'F', 'Botosani', 'AniaCarisa@gmail.com', '0724385138', 157);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (314,'Alisa', 'Francesca', 'F', 'Campina', 'AlisaFrancesca@gmail.com', '0724365541', 157);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (315,'Nadia', 'Flaviusa', 'F', 'Mangalia', 'NadiaFlaviusa@gmail.com', '0724357391', 158);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (316,'Dalia', 'Dora', 'F', 'Predeal', 'DaliaDora@gmail.com', '0724380735', 158);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (317,'Bogdan', 'Lucian', 'M', 'Deva', 'BogdanLucian@gmail.com', '0724363417', 159);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (318,'Eduard', 'Liviu', 'M', 'Constanta', 'EduardLiviu@gmail.com', '0724383785', 159);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (319,'Edith', 'Catarina', 'F', 'Bacau', 'EdithCatarina@gmail.com', '0724358813', 160);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (320,'Flavia', 'Delia', 'F', 'Braila', 'FlaviaDelia@gmail.com', '0724386438', 160);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (321,'Elia', 'Mabel', 'F', 'Sibiu', 'EliaMabel@gmail.com', '0724362377', 161);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (322,'Alisa', 'Sonia', 'F', 'Deva', 'AlisaSonia@gmail.com', '0724382146', 161);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (323,'Ovidiu', 'Iulian', 'M', 'Ploiesti', 'OvidiuIulian@gmail.com', '0724385391', 162);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (324,'Alexandru', 'Adelin', 'M', 'Brasov', 'AlexandruAdelin@gmail.com', '0724372699', 162);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (325,'Iulian', 'Madalin', 'M', 'Constanta', 'IulianMadalin@gmail.com', '0724375472', 163);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (326,'Anton', 'Catalin', 'M', 'Predeal', 'AntonCatalin@gmail.com', '0724353967', 163);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (327,'Lucian', 'Teodor', 'M', 'Bals', 'LucianTeodor@gmail.com', '0724385170', 164);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (328,'Gabriel', 'Emilian', 'M', 'Botosani', 'GabrielEmilian@gmail.com', '0724365053', 164);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (329,'Iris', 'Mabel', 'F', 'Brasov', 'IrisMabel@gmail.com', '0724366818', 165);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (330,'Eliza', 'Linda', 'F', 'Rasnov', 'ElizaLinda@gmail.com', '0724381861', 165);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (331,'Dora', 'Francesca', 'F', 'Arad', 'DoraFrancesca@gmail.com', '0724386501', 166);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (332,'Flavia', 'Arisa', 'F', 'Rasnov', 'FlaviaArisa@yahoo.com', '0724366505', 166);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (333,'Paul', 'Costinel', 'M', 'Deva', 'PaulCostinel@yahoo.com', '0724385057', 167);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (334,'Eduard', 'Lucian', 'M', 'Constanta', 'EduardLucian@gmail.com', '0724379346', 167);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (335,'Pavel', 'Emilian', 'M', 'Moreni', 'PavelEmilian@gmail.com', '0724364290', 168);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (336,'Bogdan', 'Andrei', 'M', 'Arad', 'BogdanAndrei@gmail.com', '0724356493', 168);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (337,'Carla', 'Edith', 'F', 'Bacau', 'CarlaEdith@gmail.com', '0724368281', 169);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (338,'Carla', 'Gratiela', 'F', 'Bacau', 'CarlaGratiela@gmail.com', '0724370900', 169);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (339,'Elvira', 'Elvira', 'F', 'Braila', 'ElviraElvira@gmail.com', '0724357417', 170);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (340,'Edi', 'Fabiana', 'F', 'Brasov', 'EdiFabiana@yahoo.com', '0724370989', 170);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (341,'Linda', 'Petra', 'F', 'Mangalia', 'LindaPetra@gmail.com', '0724367473', 171);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (342,'Alisa', 'Flavia', 'F', 'Craiova', 'AlisaFlavia@gmail.com', '0724367901', 171);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (343,'Ivan', 'Laurentiu', 'M', 'Bals', 'IvanLaurentiu@gmail.com', '0724378570', 172);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (344,'David', 'Bogdan', 'M', 'Sinaia', 'DavidBogdan@gmail.com', '0724369459', 172);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (345,'Daniel', 'Valentin', 'M', 'Deva', 'DanielValentin@gmail.com', '0724383823', 173);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (346,'Pavel', 'Alexandru', 'M', 'Botosani', 'PavelAlexandru@gmail.com', '0724365085', 173);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (349,'Robert', 'Madalin', 'M', 'Alexandria', 'RobertMadalin@gmail.com', '0724369363', 175);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (350,'Adelin', 'Raul', 'M', 'Braila', 'AdelinRaul@gmail.com', '0724362985', 175);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (351,'Catalin', 'Cosminut', 'M', 'Predeal', 'CatalinCosminut@yahoo.com', '0724379946', 176);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (352,'Emilian', 'Paul', 'M', 'Moreni', 'EmilianPaul@gmail.com', '0724385120', 176);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (353,'Leila', 'Renata', 'F', 'Predeal', 'LeilaRenata@gmail.com', '0724384074', 177);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (354,'Alma', 'Catarina', 'F', 'Bucuresti', 'AlmaCatarina@gmail.com', '0724356407', 177);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (355,'Andrei', 'Cosmin', 'M', 'Bacau', 'AndreiCosmin@gmail.com', '0724368034', 178);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (356,'Anton', 'Florin', 'M', 'Bals', 'AntonFlorin@gmail.com', '0724354064', 178);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (357,'Ivan', 'Sorin', 'M', 'Alexandria', 'IvanSorin@gmail.com', '0724357227', 179);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (358,'David', 'Stefan', 'M', 'Ploiesti', 'DavidStefan@gmail.com', '0724380901', 179);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (359,'Ania', 'Gloria', 'F', 'Sinaia', 'AniaGloria@gmail.com', '0724358776', 180);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (360,'Alisa', 'Dalia', 'F', 'Sibiu', 'AlisaDalia@gmail.com', '0724356081', 180);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (361,'George', 'Andrei', 'M', 'Bucuresti', 'GeorgeAndrei@gmail.com', '0724385245', 181);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (362,'Octavian', 'Teodor', 'M', 'Campina', 'OctavianTeodor@gmail.com', '0724376170', 181);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (363,'Florin', 'Andrei', 'M', 'Rasnov', 'FlorinAndrei@gmail.com', '0724362380', 182);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (364,'Sorin', 'Emilian', 'M', 'Botosani', 'SorinEmilian@gmail.com', '0724358754', 182);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (365,'Alexandru', 'Alexandru', 'M', 'Sighisoara', 'AlexandruAlexandru@gmail.com', '0724364755', 183);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (366,'Sorin', 'Sebastian', 'M', 'Sighisoara', 'SorinSebastian@gmail.com', '0724368091', 183);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (367,'Eliza', 'Blanca', 'F', 'Bals', 'ElizaBlanca@gmail.com', '0724380175', 184);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (368,'Bela', 'Iris', 'F', 'Galati', 'BelaIris@gmail.com', '0724381018', 184);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (369,'Elia', 'Karina', 'F', 'Bacau', 'EliaKarina@gmail.com', '0724383753', 185);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (370,'Blanca', 'Fabiana', 'F', 'Rasnov', 'BlancaFabiana@gmail.com', '0724360816', 185);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (371,'Eduard', 'Madalin', 'M', 'Bacau', 'EduardMadalin@gmail.com', '0724367126', 186);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (372,'Eduard', 'Gabriel', 'M', 'Mangalia', 'EduardGabriel@gmail.com', '0724379572', 186);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (373,'Elvira', 'Iris', 'F', 'Galati', 'ElviraIris@gmail.com', '0724374749', 187);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (374,'Leila', 'Catarina', 'F', 'Rasnov', 'LeilaCatarina@gmail.com', '0724385455', 187);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (375,'David', 'Sate', 'M', 'Botosani', 'DavidSate@gmail.com', '0724378247', 188);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (376,'Sebastian', 'Alexandru', 'M', 'Sibiu', 'SebastianAlexandru@gmail.com', '0724372004', 188);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (377,'Paul', 'Madalin', 'M', 'Alexandria', 'PaulMadalin@gmail.com', '0724363875', 189);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (378,'Adelin', 'Eduard', 'M', 'Deva', 'AdelinEduard@gmail.com', '0724362141', 189);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (379,'Nadia', 'Renate', 'F', 'Brasov', 'NadiaRenate@yahoo.com', '0724383926', 190);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (380,'Gratiela', 'Hortensia', 'F', 'Mangalia', 'GratielaHortensia@gmail.com', '0724369325', 190);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (381,'Mabel', 'Eliza', 'F', 'Bacau', 'MabelEliza@gmail.com', '0724370842', 191);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (382,'Miruna', 'Alisa', 'F', 'Arad', 'MirunaAlisa@gmail.com', '0724357290', 191);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (383,'Emilian', 'Panela', 'M', 'Alexandria', 'EmilianPanela@gmail.com', '0724368682', 192);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (384,'Sebastian', 'Ionut', 'M', 'Constanta', 'SebastianIonut@gmail.com', '0724382872', 192);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (385,'George', 'Alex', 'M', 'Ploiesti', 'GeorgeAlex@gmail.com', '0724363062', 193);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (386,'Laurentiu', 'Florin', 'M', 'Deva', 'LaurentiuFlorin@gmail.com', '0724382012', 193);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (387,'Nadia', 'Carla', 'F', 'Moreni', 'NadiaCarla@gmail.com', '0724373093', 194);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (388,'Aris', 'Nadira', 'F', 'Campina', 'ArisNadira@gmail.com', '0724369707', 194);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (389,'Catalin', 'Daniel', 'M', 'Constanta', 'CatalinDaniel@gmail.com', '0724355225', 195);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (390,'Anton', 'Stefan', 'M', 'Brasov', 'AntonStefan@gmail.com', '0724377080', 195);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (391,'Daniel', 'Stefan', 'M', 'Bucuresti', 'DanielStefan@gmail.com', '0724380325', 196);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (392,'Iulian', 'Moise', 'M', 'Sinaia', 'IulianMoise@gmail.com', '0724358587', 196);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (393,'Ivan', 'Dragos', 'M', 'Brasov', 'IvanDragos@gmail.com', '0724366571', 197);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (394,'Marius', 'Robert', 'M', 'Bacau', 'MariusRobert@gmail.com', '0724373307', 197);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (395,'Miruna', 'Francesca', 'F', 'Bals', 'MirunaFrancesca@gmail.com', '0724375282', 198);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (396,'Leila', 'Nadia', 'F', 'Arad', 'LeilaNadia@gmail.com', '0724357075', 198);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (397,'Daniel', 'Costin', 'M', 'Campulung', 'DanielCostin@gmail.com', '0724374387', 199);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (398,'Paul', 'Andrei', 'M', 'Sibiu', 'PaulAndrei@gmail.com', '0724383341', 199);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (401,'Casiana', 'Sonia', 'F', 'Botosani', 'CasianaSonia@gmail.com', '0724376487', 201);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (402,'Carla', 'Casiana', 'F', 'Sighisoara', 'CarlaCasiana@gmail.com', '0724375305', 201);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (403,'Daniel', 'Dani', 'M', 'Predeal', 'DanielDani@yahoo.com', '0724365973', 202);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (404,'Adelin', 'Sebastian', 'M', 'Deva', 'AdelinSebastian@gmail.com', '0724366827', 202);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (405,'Octavian', 'George', 'M', 'Brasov', 'OctavianGeorge@gmail.com', '0724381830', 203);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (406,'George', 'Laurentiu', 'M', 'Craiova', 'GeorgeLaurentiu@gmail.com', '0724361614', 203);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (407,'Iulian', 'Paul', 'M', 'Alexandria', 'IulianPaul@gmail.com', '0724359619', 204);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (408,'Costin', 'Sorinus', 'M', 'Mangalia', 'CostinSorinus@yahoo.com', '0724363050', 204);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (409,'Carla', 'Linda', 'F', 'Bucuresti', 'CarlaLinda@gmail.com', '0724361269', 205);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (410,'Karina', 'Rebeca', 'F', 'Brasov', 'KarinaRebeca@gmail.com', '0724374974', 205);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (411,'Dora', 'Flavia', 'F', 'Braila', 'DoraFlavia@gmail.com', '0724363974', 206);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (412,'Linda', 'Edith', 'F', 'Sighisoara', 'LindaEdith@gmail.com', '0724385387', 206);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (413,'Alisa', 'Roberta', 'F', 'Mangalia', 'AlisaRoberta@gmail.com', '0724372991', 207);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (414,'Eliza', 'Edith', 'F', 'Moreni', 'ElizaEdith@gmail.com', '0724377294', 207);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (416,'Alexandru', 'Catalin', 'M', 'Campina', 'AlexandruCatalin@gmail.com', '0724373290', 208);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (417,'Ivan', 'Alex', 'M', 'Deva', 'IvanAlex@yahoo.com', '0724365349', 209);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (418,'Dragos', 'Lucian', 'M', 'Bucuresti', 'DragosLucian@gmail.com', '0724353915', 209);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (419,'Ania', 'Karina', 'F', 'Campina', 'AniaKarina@gmail.com', '0724381262', 210);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (420,'Bela', 'Francesca', 'F', 'Deva', 'BelaFrancesca@gmail.com', '0724367199', 210);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (421,'Octavian', 'Costin', 'M', 'Arad', 'OctavianCostin@gmail.com', '0724359197', 211);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (422,'Iulian', 'Dragosel', 'M', 'Arad', 'IulianD@yahoo.com', '0724382999', 211);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (423,'Catalin', 'Bogdanutu', 'M', 'Galati', 'CatalinBogdan@yahoo.com', '0724362647', 212);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (424,'Alexandru', 'Raul', 'M', 'Sibiu', 'AlexandruRaul@gmail.com', '0724360936', 212);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (425,'Liviu', 'Cosmin', 'M', 'Bacau', 'LiviuCosmin@gmail.com', '0724386612', 213);
insert into STUDENTI (id_student, nume, prenume, sex, oras, email, nr_telefon, id_camera) values (426,'Lucian', 'David', 'M', 'Sinaia', 'LucianDavid@gmail.com', '0724374546', 213);

CREATE TABLE ANGAJATI
(
  id_angajat INT constraint pk_angajat primary key,
  nume VARCHAR(30) constraint nn_nume NOT NULL,
  prenume VARCHAR(30) constraint nn_prenume NOT NULL,
  data_nastere DATE constraint nn_data_nastere NOT NULL,
  oras VARCHAR(30) constraint nn_oras NOT NULL,
  strada VARCHAR(30) ,
  nr_telefon CHAR(11) constraint nn_nr_telefon NOT NULL,
  salariul NUMERIC(7,2) constraint nn_salariul NOT NULL,
  id_job INT constraint nn_job NOT NULL,
  constraint fk_job FOREIGN KEY (id_job) REFERENCES JOBURI(id_job) on delete cascade,
  constraint un_telefon UNIQUE (nr_telefon),
  constraint ch_strada check(len(strada)>2),
  constraint ch_nr_telefon check(len(nr_telefon)=10)
);

insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (1,'Preda', 'Marian',convert(date,'20/03/1970',103), 'Bucuresti', 'Academiei', '0727950353', 3978.78, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (2,'Avram', 'Vlad',convert(date,'12/04/1983',103), 'Bucuresti', 'Abus', '0724526782', 3800.28, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (3,'Marian', 'Ionut',convert(date,'2/10/1972',103), 'Bucuresti', 'Zizin', '0729552856', 3902.30, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (4,'Iulian', 'Marcu',convert(date,'12/04/1983',103), 'Bucuresti', 'Zeicani', '0722674560', 3554.8, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (5,'Avram', 'Alex',convert(date,'17/9/1977',103), 'Bucuresti', 'Garlei', '0738724620', 3579.10, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (6,'Valeriu', 'Iustin',convert(date,'02/07/1974',103), 'Bucuresti', 'Fruntasului', '0727932145', 3488.88, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (7,'Ionut', 'Nelu',convert(date,'10/09/1984',103), 'Bucuresti', 'Baiculesti', '0758723441', 3222.77, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (8,'Alex', 'Vladimir',convert(date,'18/09/1978',103), 'Bucuresti', 'Frezorilor', '0776432160', 3554.18, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (9,'Vlad', 'Radu',convert(date,'11/11/1980',103), 'Magurele', 'Dunei', '0726452905', 3550.99, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (10,'Klaus', 'Raul',convert(date,'13/06/1979',103), 'Balotesti', 'Principala', '0725411278', 3822.2, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (11,'Marius', 'Andrei',convert(date,'20/02/1977',103), 'Bucuresti', 'Abus', '0724526788', 3908, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (12,'Costi', 'Ionut',convert(date,'22/01/1987',103), 'Branesti', 'Teilor', '0724567882', 38700.58, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (13,'Marcel', 'Valeria',convert(date,'11/11/1982',103), 'Bucuresti', 'Banat', '0724524532', 3890.8, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (14,'Avramescu', 'Ioana',convert(date,'19/10/1980',103), 'Bucuresti', 'Godeni', '0765342782', 3872.8, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (15,'Dodea', 'Iustin',convert(date,'29/01/1979',103), 'Buftea', 'Lebedei', '0723543664', 3332.8, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (16,'Neluta', 'Valentin',convert(date,'20/10/1975',103), 'Bucuresti', 'Plopului', '0727677892', 3765.93, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (17,'Marcela', 'Denisa',convert(date,'15/10/1980',103), 'Bucuresti', 'Popisteanu', '0722334454', 3988.15, 1);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (18,'Constin', 'Alexandru',convert(date,'14/07/1980',103), 'Magurele', 'Codrului', '0728990345', 3825.65, 1);

insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (19,'Gava', 'Marian',convert(date,'02/12/1970',103), 'Bucuresti', 'Frumoasa', '0737950353', 1978.78, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (20,'Valcu', 'Vlad',convert(date,'13/04/1983',103), 'Bucuresti', 'Balilea', '0734526782', 1800.28, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (21,'Stefan', 'Ionut',convert(date,'04/11/1970',103), 'Bucuresti', 'Zizin', '0739542856', 1902.30, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (22,'Iulian', 'Andrei',convert(date,'02/04/1984',103), 'Bucuresti', 'Baia', '0782674560', 1554.8, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (23,'Avram', 'Iutinel',convert(date,'07/09/1987',103), 'Bucuresti', 'Plutasilor', '0768724620', 1579.10, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (24,'Valeriu', 'Mircea',convert(date,'14/11/1984',103), 'Bucuresti', 'Finlanda', '0747932145', 1488.88, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (25,'Ionut', 'Andrei',convert(date,'01/10/1977',103), 'Bucuresti', 'Ariei', '0738723441', 1222.77, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (26,'Mracu', 'Vladimir',convert(date,'01/09/1976',103), 'Bucuresti', 'Fagului', '0773432160', 1554.18, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (27,'Vlad', 'Jeni',convert(date,'01/11/1981',103), 'Magurele', 'Fermei', '0729670207', 1550.99, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (28,'Valetin', 'Raul',convert(date,'12/05/1978',103), 'Branesti', 'Noua', '0725477278', 1822.2, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (29,'Costin', 'Andrei',convert(date,'25/12/1974',103), 'Bucuresti', 'Abus', '0725426788', 1908, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (30,'Oncescu', 'Ionut',convert(date,'20/01/1980',103), 'Branesti', 'Violelor', '0754567882', 18700.58, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (31,'Marcel', 'Ioana',convert(date,'11/01/1981',103), 'Magurele', 'Lanului', '0778524532', 1890.8, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (32,'Gavril', 'Ioana',convert(date,'16/11/1982',103), 'Bucuresti', 'Avantului', '0715342782', 1872.8, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (33,'Lupu', 'Iustin',convert(date,'29/10/1977',103), 'Buftea', 'Macesului', '0729543664', 1332.8, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (34,'Brad', 'Valentin',convert(date,'22/05/1985',103), 'Buftea', 'Amurgului', '0767677892', 1765.93, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (35,'Marcel', 'Denis',convert(date,'15/10/1982',103), 'Bucuresti', 'Bacului', '0777334454', 1988.15, 2);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (36,'Constinescu', 'Alexa',convert(date,'14/08/1980',103), 'Magurele', 'Codrului', '0738990345', 1825.65, 2);

insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (37,'Onea', 'Sorinel',convert(date,'21/06/1973',103), 'Bucuresti', 'Mues', '0727750353', 2978.78, 3);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (38,'Avram', 'Iancu',convert(date,'11/09/1987',103), 'Bucuresti', 'Abus', '0747526782', 2800.28, 3);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (39,'Marius', 'Ionut',convert(date,'22/12/1982',103), 'Bucuresti', 'Nades', '0767852856', 2902.30, 3);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (40,'Radu', 'Nelut',convert(date,'16/09/1973',103), 'Bucuresti', 'Dej', '0724356210', 2554.8, 3);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (41,'Casian', 'Mourice',convert(date,'13/09/1975',103), 'Bucuresti', 'Volumului', '0738776220', 3279.10, 3);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (42,'Fenol', 'Iustin',convert(date,'09/12/1984',103), 'Bucuresti', 'Fruntasului', '0729932145', 3488.88, 3);

insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (43,'Raucea', 'Sorinela',convert(date,'11/02/1983',103), 'Bucuresti', 'Mexic', '0745750353', 1978.78, 4);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (44,'Marcu', 'Ionela',convert(date,'01/01/1988',103), 'Bucuresti', 'Craciun', '0706526782', 1800.28, 4);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (45,'Docav', 'Mihai',convert(date,'17/10/1972',103), 'Bucuresti', 'Craiovei', '0712352856', 1902.30, 4);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (46,'Radu', 'Ioana',convert(date,'28/05/1989',103), 'Bucuresti', 'Copilului', '0744656210', 1554.8, 4);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (47,'Motrun', 'Vlad',convert(date,'23/02/1975',103), 'Bucuresti', 'Volumului', '0790776220', 2279.10, 4);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (48,'Moise', 'Andrei',convert(date,'17/12/1984',103), 'Bucuresti', 'Trusesti', '0743932145', 2488.88, 4);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (49,'Negus', 'Valentin',convert(date,'23/11/1978',103), 'Bucuresti', 'Vacantei', '0723476220', 2279.10, 4);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (50,'Mate', 'Ana',convert(date,'18/01/1982',103), 'Bucuresti', 'Mihai Viteazu', '0708932145', 2488.88, 4);

insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (51,'Raucea', 'Sorinela',convert(date,'21/12/1973',103), 'Bucuresti', 'Mirutei', '0745750359', 3278.98, 5);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (52,'Marcu', 'Ionela',convert(date,'11/11/1977',103), 'Bucuresti', 'Turda', '0726526782', 3500.8, 5);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (53,'Docav', 'Mihai',convert(date,'27/07/1979',103), 'Bucuresti', 'Trusesti', '0752352856', 3302.32, 5);
insert into ANGAJATI (id_angajat, nume, prenume, data_nastere,oras, strada, nr_telefon, salariul, id_job) values (54,'Radu', 'Ioana',convert(date,'26/02/1979',103), 'Bucuresti', 'Copilului', '0704656210', 3354.2, 5);

CREATE TABLE CONTRACTE
(
  data_inceput DATE constraint nn_data_inceput NOT NULL,
  data_final DATE constraint nn_data_final NOT NULL,
  id_contract INT constraint pk_constraint primary key,
  id_cladire INT constraint nn_cladire NOT NULL,
  id_angajat INT constraint nn_adgajat NOT NULL,
  constraint fk_cladire_c FOREIGN KEY (id_cladire) REFERENCES CLADIRI(id_cladire) on delete cascade,
  constraint fk_agajat_c FOREIGN KEY (id_angajat) REFERENCES ANGAJATI(id_angajat) on delete cascade,
  constraint ch_date check (data_inceput<data_final)
  
);

insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'21/02/2018',103), convert(date,'21/02/2025',103), 1, 1, 1)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'01/12/2015',103), convert(date,'01/12/2025',103), 2, 2, 2)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'11/04/2011',103), convert(date,'11/04/2021',103), 3, 3, 3)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'21/10/2012',103), convert(date,'21/10/2022',103), 4, 4, 4)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'11/05/2012',103), convert(date,'11/12/2025',103), 5, 5, 5)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'03/07/2017',103), convert(date,'03/07/2027',103), 6, 6, 6)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'18/06/2013',103), convert(date,'18/06/2025',103), 7, 7, 7)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'12/08/2016',103), convert(date,'12/08/2022',103), 8, 8, 8)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'11/06/2017',103), convert(date,'11/06/2025',103), 9, 9, 19)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'19/11/2013',103), convert(date,'19/11/2022',103), 10, 10, 10)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'20/07/2014',103), convert(date,'20/07/2025',103), 11, 11, 11)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'09/03/2011',103), convert(date,'09/03/2025',103), 12, 13, 13)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'06/10/2013',103), convert(date,'06/10/2022',103), 13, 14, 14)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'25/03/2017',103), convert(date,'25/03/2025',103), 14, 15, 15)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'09/10/2015',103), convert(date,'09/10/2022',103), 15, 16, 16)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'11/08/2014',103), convert(date,'11/08/2025',103), 16, 17, 17)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'18/11/2013',103), convert(date,'18/11/2022',103), 17, 18, 18)

insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'11/03/2018',103), convert(date,'11/03/2029',103), 18, 1, 19)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'21/11/2013',103), convert(date,'21/11/2028',103), 19, 2, 20)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'14/08/2017',103), convert(date,'14/08/2026',103), 20, 3, 21)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'02/12/2019',103), convert(date,'02/12/2029',103), 21, 4, 22)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'14/06/2010',103), convert(date,'14/05/2024',103), 22, 5, 23)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'08/07/2012',103), convert(date,'08/07/2022',103), 23, 6, 24)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'20/07/2016',103), convert(date,'20/07/2026',103), 24, 7, 25)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'21/09/2010',103), convert(date,'21/09/2027',103), 25, 8, 26)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'27/10/2018',103), convert(date,'27/10/2023',103), 27, 10, 28)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'29/03/2014',103), convert(date,'29/03/2026',103), 28, 11, 29)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'21/03/2016',103), convert(date,'21/03/2020',103), 29, 13, 31)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'08/10/2020',103), convert(date,'08/10/2023',103), 30, 14, 32)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'09/03/2013',103), convert(date,'09/04/2023',103), 31, 15, 33)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'10/11/2013',103), convert(date,'10/11/2026',103), 32, 16, 34)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'15/08/2018',103), convert(date,'15/08/2022',103), 33, 17, 35)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'19/10/2013',103), convert(date,'19/10/2024',103), 34, 18, 36)

insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'01/03/2016',103), convert(date,'01/03/2027',103), 35, 4, 37)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'05/11/2016',103), convert(date,'05/11/2028',103), 36, 4, 38)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'02/07/2011',103), convert(date,'02/07/2028',103), 37, 9, 39)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'11/10/2013',103), convert(date,'11/10/2029',103), 38, 9, 40)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'15/09/2019',103), convert(date,'15/09/2023',103), 39, 17, 41)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'10/10/2018',103), convert(date,'10/10/2024',103), 40, 17, 42)

insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'10/05/2018',103), convert(date,'10/05/2029',103), 41, 1, 43)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'12/10/2013',103), convert(date,'12/10/2028',103), 42, 2, 43)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'13/09/2017',103), convert(date,'13/09/2026',103), 43, 3, 44)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'05/11/2019',103), convert(date,'05/11/2029',103), 44, 4, 44)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'17/05/2010',103), convert(date,'17/05/2024',103), 45, 5, 44)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'02/02/2012',103), convert(date,'02/02/2022',103), 46, 6, 45)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'24/08/2016',103), convert(date,'24/08/2026',103), 47, 7, 45)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'20/03/2010',103), convert(date,'20/03/2027',103), 48, 8, 45)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'24/05/2017',103), convert(date,'20/05/2028',103), 49, 9, 46)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'24/12/2018',103), convert(date,'24/12/2023',103), 50, 10, 47)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'22/03/2014',103), convert(date,'22/03/2026',103), 51, 11, 47)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'25/06/2016',103), convert(date,'25/06/2020',103), 52, 13, 48)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'09/12/2020',103), convert(date,'09/12/2023',103), 53, 14, 48)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'10/05/2013',103), convert(date,'10/05/2023',103), 54, 15, 49)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'12/12/2013',103), convert(date,'12/12/2026',103), 55, 16, 49)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'16/05/2018',103), convert(date,'16/05/2022',103), 56, 17, 50)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'10/12/2013',103), convert(date,'10/12/2024',103), 57, 18, 50)

insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'18/04/2018',103), convert(date,'18/04/2029',103), 58, 1, 51)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'24/11/2013',103), convert(date,'24/11/2028',103), 59, 2, 51)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'12/09/2017',103), convert(date,'12/09/2026',103), 60, 3, 51)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'09/11/2019',103), convert(date,'09/11/2029',103), 61, 4, 51)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'04/06/2010',103), convert(date,'04/06/2024',103), 62, 5, 51)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'14/09/2012',103), convert(date,'14/09/2022',103), 63, 6, 52)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'24/07/2016',103), convert(date,'24/07/2026',103), 64, 7, 52)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'11/03/2010',103), convert(date,'11/03/2027',103), 65, 8, 52)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'14/01/2017',103), convert(date,'14/01/2028',103), 66, 9, 52)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'27/10/2018',103), convert(date,'27/10/2023',103), 67, 10, 53)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'29/04/2014',103), convert(date,'29/04/2026',103), 68, 11, 53)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'11/05/2016',103), convert(date,'12/05/2020',103), 69, 13, 53)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'18/11/2020',103), convert(date,'18/1/2023',103), 70, 14, 53)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'06/05/2013',103), convert(date,'06/05/2023',103), 71, 15, 54)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'12/12/2013',103), convert(date,'12/12/2026',103), 72, 16, 54)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'11/08/2018',103), convert(date,'11/08/2022',103), 73, 17, 54)
insert into CONTRACTE (data_inceput, data_final, id_contract, id_cladire, id_angajat) values (convert(date,'13/11/2013',103), convert(date,'13/11/2024',103), 74, 18, 54)