BEGIN
    --Paises
    pkg_country.createCountry('Costa Rica');
    pkg_country.createCountry('Nicaragua');
    pkg_country.createCountry('Panamá');
    pkg_country.createCountry('El Salvador');
    pkg_country.createCountry('Guatemala');
    pkg_country.createCountry('Honduras');
    pkg_country.createCountry('Belice');
    --Provincias
    pkg_province.createProvince('San José', 1);
    pkg_province.createProvince('Cartago', 1);
    pkg_province.createProvince('Heredia', 1);
    pkg_province.createProvince('Alajuela', 1);
    pkg_province.createProvince('Limón', 1);
    pkg_province.createProvince('Puntarenas', 1);
    pkg_province.createProvince('Guanacaste', 1);
    pkg_province.createProvince('Managua', 2);
    pkg_province.createProvince('León', 2);
    pkg_province.createProvince('Veraguas', 3);
    pkg_province.createProvince('Los Santos', 3);
    pkg_province.createProvince('La Paz', 4);
    pkg_province.createProvince('Ahuachapán', 4);
    pkg_province.createProvince('Puerto Barrios', 5);
    pkg_province.createProvince('Alta Verapaz', 5);
    pkg_province.createProvince('Yoro', 6);
    pkg_province.createProvince('Olancho', 6);
    pkg_province.createProvince('Cayo', 7);
    pkg_province.createProvince('Toledo', 7);
    --Cantones San José
    pkg_canton.createCanton('Central', 1);
    pkg_canton.createCanton('Acosta', 1);
    pkg_canton.createCanton('Alajuelita', 1);
    pkg_canton.createCanton('Aserrí', 1);
    pkg_canton.createCanton('Curridabat', 1);
    pkg_canton.createCanton('Desamparados', 1);
    pkg_canton.createCanton('Dota', 1);
    pkg_canton.createCanton('Escazú', 1);
    pkg_canton.createCanton('Goicochea', 1);
    pkg_canton.createCanton('León Cortés', 1);
    pkg_canton.createCanton('Montes de Oca', 1);
    pkg_canton.createCanton('Mora', 1);
    pkg_canton.createCanton('Moravia', 1);
    pkg_canton.createCanton('Pérez Zeledón', 1);
    pkg_canton.createCanton('Puriscal', 1);
    pkg_canton.createCanton('Santa Ana', 1);
    pkg_canton.createCanton('Tarrazú', 1);
    pkg_canton.createCanton('Tibás', 1);
    pkg_canton.createCanton('Turrubares', 1);
    pkg_canton.createCanton('Vázquez de Coronado', 1);
    --Distritos San José
    pkg_district.createDistrict('Carmen', 1);
    pkg_district.createDistrict('Catedral', 1);
    pkg_district.createDistrict('Hatillo', 1);
    pkg_district.createDistrict('Hospital', 1);
    pkg_district.createDistrict('La Uruca', 1);
    pkg_district.createDistrict('Mata Redonda', 1);
    pkg_district.createDistrict('Merced', 1);
    pkg_district.createDistrict('Pavas', 1);
    pkg_district.createDistrict('San Francisco', 1);
    pkg_district.createDistrict('San Sebastián', 1);
    pkg_district.createDistrict('Zapote', 1);
    
    pkg_district.createDistrict('Cangrejal', 2);
    pkg_district.createDistrict('Guaitil', 2);
    pkg_district.createDistrict('Palmichal', 2);
    pkg_district.createDistrict('Sabanillas', 2);
    pkg_district.createDistrict('San Ignacio', 2);
    
    pkg_district.createDistrict('Alajuelita', 3);
    pkg_district.createDistrict('Concepción', 3);
    pkg_district.createDistrict('San Antonio', 3);
    pkg_district.createDistrict('San Felipe', 3);
    pkg_district.createDistrict('San Josecito', 3);
    
    pkg_district.createDistrict('Aserrí', 4);
    pkg_district.createDistrict('Legua', 4);
    pkg_district.createDistrict('Monterrey', 4);
    pkg_district.createDistrict('Salitrillos', 4);
    pkg_district.createDistrict('San Gabriel', 4);
    pkg_district.createDistrict('Tarbaca', 4);
    pkg_district.createDistrict('Vuelta de Jorco', 4);
    
    pkg_district.createDistrict('Curridabat', 5);
    pkg_district.createDistrict('Granadilla', 5);
    pkg_district.createDistrict('Sánchez', 5);
    pkg_district.createDistrict('Tirrases', 5);
    
    pkg_district.createDistrict('Damas', 6);
    pkg_district.createDistrict('Desamparados', 6);
    pkg_district.createDistrict('Frailes', 6);
    pkg_district.createDistrict('Gravilias', 6);
    pkg_district.createDistrict('Los Guido', 6);
    pkg_district.createDistrict('Patarrá', 6);
    pkg_district.createDistrict('Rosario', 6);
    pkg_district.createDistrict('San Antonio', 6);
    pkg_district.createDistrict('San Cristóbal', 6);
    pkg_district.createDistrict('San Juan de Dios', 6);
    pkg_district.createDistrict('San Miguel', 6);
    pkg_district.createDistrict('San Rafael Abajo', 6);
    pkg_district.createDistrict('San Rafael Arriba', 6);
    
    pkg_district.createDistrict('Copey', 7);
    pkg_district.createDistrict('Jardín', 7);
    pkg_district.createDistrict('Santa María', 7);
    
    pkg_district.createDistrict('Escazú', 8);
    pkg_district.createDistrict('San Antonio', 8);
    pkg_district.createDistrict('San Rafael', 8);
    
    pkg_district.createDistrict('Calle Blancos', 9);
    pkg_district.createDistrict('Guadalupe', 9);
    pkg_district.createDistrict('Ipís', 9);
    pkg_district.createDistrict('Mata de Plátano', 9);
    pkg_district.createDistrict('Purral', 9);
    pkg_district.createDistrict('Rancho Redondo', 9);
    pkg_district.createDistrict('San Francisco', 9);
    
    pkg_district.createDistrict('San Pablo', 10);
    pkg_district.createDistrict('San Andrés', 10);
    pkg_district.createDistrict('Llano Bonito', 10);
    pkg_district.createDistrict('San Isidro', 10);
    pkg_district.createDistrict('Santa Cruz', 10);
    pkg_district.createDistrict('San Antonio', 10);
    
    pkg_district.createDistrict('Mercedes', 11);
    pkg_district.createDistrict('Sabanilla', 11);
    pkg_district.createDistrict('San Pedro', 11);
    pkg_district.createDistrict('San Rafael', 11);
    
    pkg_district.createDistrict('Ciudad Colón', 12);
    pkg_district.createDistrict('Guayabo', 12);
    pkg_district.createDistrict('Jaris', 12);
    pkg_district.createDistrict('Picagres', 12);
    pkg_district.createDistrict('Piedras Negras', 12);
    pkg_district.createDistrict('Tabarcia', 12);
    
    pkg_district.createDistrict('San Jerónimo', 13);
    pkg_district.createDistrict('San Vicente', 13);
    pkg_district.createDistrict('Trinidad', 13);
    
    pkg_district.createDistrict('San Isidro de El General', 14);
    pkg_district.createDistrict('Barú', 14);
    pkg_district.createDistrict('Cajón', 14);
    pkg_district.createDistrict('Daniel Flores', 14);
    pkg_district.createDistrict('El General', 14);
    pkg_district.createDistrict('La Amistad', 14);
    pkg_district.createDistrict('Páramo', 14);
    pkg_district.createDistrict('Pejibaye', 14);
    pkg_district.createDistrict('Platanares', 14);
    pkg_district.createDistrict('Río Nuevo', 14);
    pkg_district.createDistrict('Rivas', 14);
    pkg_district.createDistrict('San Pedro', 14);
    
    pkg_district.createDistrict('Barbacoas', 15);
    pkg_district.createDistrict('Candelarita', 15);
    pkg_district.createDistrict('Chires', 15);
    pkg_district.createDistrict('Desamparaditos', 15);
    pkg_district.createDistrict('Grifo Alto', 15);
    pkg_district.createDistrict('Mercedes Sur', 15);
    pkg_district.createDistrict('San Antonio', 15);
    pkg_district.createDistrict('San Rafael', 15);
    pkg_district.createDistrict('Santiago', 15);
    
    pkg_district.createDistrict('Brasil', 16);
    pkg_district.createDistrict('Piedades', 16);
    pkg_district.createDistrict('Pozos', 16);
    pkg_district.createDistrict('Salitral', 16);
    pkg_district.createDistrict('Santa Ana', 16);
    pkg_district.createDistrict('Uruca', 16);
    
    pkg_district.createDistrict('San Carlos', 17);
    pkg_district.createDistrict('San Lorenzo', 17);
    pkg_district.createDistrict('San Marcos', 17);
    
    pkg_district.createDistrict('Anselmo Llorente', 18);
    pkg_district.createDistrict('Cinco Esquinas', 18);
    pkg_district.createDistrict('Colima', 18);
    pkg_district.createDistrict('León XIII', 18);
    pkg_district.createDistrict('San Juan', 18);
    
    pkg_district.createDistrict('Carara', 19);
    pkg_district.createDistrict('San Juan de Mata', 19);
    pkg_district.createDistrict('San Luis', 19);
    pkg_district.createDistrict('San Pablo', 19);
    pkg_district.createDistrict('San Pedro', 19);
    
    pkg_district.createDistrict('Cascajal', 20);
    pkg_district.createDistrict('Dulce Nombre de Jesús', 20);
    pkg_district.createDistrict('Patalillo', 20);
    pkg_district.createDistrict('San Isidro', 20);
    pkg_district.createDistrict('San Rafael', 20);
END;

--Insert communities
SELECT 'pkg_community.createCommunity('||''''||district_name||''', '||id_district||');' FROM district;
BEGIN
pkg_community.createCommunity('Carmen', 1);
pkg_community.createCommunity('Catedral', 2);
pkg_community.createCommunity('Hatillo', 3);
pkg_community.createCommunity('Hospital', 4);
pkg_community.createCommunity('La Uruca', 5);
pkg_community.createCommunity('Mata Redonda', 6);
pkg_community.createCommunity('Merced', 7);
pkg_community.createCommunity('Pavas', 8);
pkg_community.createCommunity('San Francisco', 9);
pkg_community.createCommunity('San Sebastián', 10);
pkg_community.createCommunity('Zapote', 11);
pkg_community.createCommunity('Cangrejal', 12);
pkg_community.createCommunity('Guaitil', 13);
pkg_community.createCommunity('Palmichal', 14);
pkg_community.createCommunity('Sabanillas', 15);
pkg_community.createCommunity('San Ignacio', 16);
pkg_community.createCommunity('Alajuelita', 17);
pkg_community.createCommunity('Concepción', 18);
pkg_community.createCommunity('San Antonio', 19);
pkg_community.createCommunity('San Felipe', 20);
pkg_community.createCommunity('San Josecito', 21);
pkg_community.createCommunity('Aserrí', 22);
pkg_community.createCommunity('Legua', 23);
pkg_community.createCommunity('Monterrey', 24);
pkg_community.createCommunity('Salitrillos', 25);
pkg_community.createCommunity('San Gabriel', 26);
pkg_community.createCommunity('Tarbaca', 27);
pkg_community.createCommunity('Vuelta de Jorco', 28);
pkg_community.createCommunity('Curridabat', 29);
pkg_community.createCommunity('Granadilla', 30);
pkg_community.createCommunity('Sánchez', 31);
pkg_community.createCommunity('Tirrases', 32);
pkg_community.createCommunity('Damas', 33);
pkg_community.createCommunity('Desamparados', 34);
pkg_community.createCommunity('Frailes', 35);
pkg_community.createCommunity('Gravilias', 36);
pkg_community.createCommunity('Los Guido', 37);
pkg_community.createCommunity('Patarrá', 38);
pkg_community.createCommunity('Rosario', 39);
pkg_community.createCommunity('San Antonio', 40);
pkg_community.createCommunity('San Cristóbal', 41);
pkg_community.createCommunity('San Juan de Dios', 42);
pkg_community.createCommunity('San Miguel', 43);
pkg_community.createCommunity('San Rafael Abajo', 44);
pkg_community.createCommunity('San Rafael Arriba', 45);
pkg_community.createCommunity('Copey', 46);
pkg_community.createCommunity('Jardín', 47);
pkg_community.createCommunity('Santa María', 48);
pkg_community.createCommunity('Escazú', 49);
pkg_community.createCommunity('San Antonio', 50);
pkg_community.createCommunity('San Rafael', 51);
pkg_community.createCommunity('Calle Blancos', 52);
pkg_community.createCommunity('Guadalupe', 53);
pkg_community.createCommunity('Ipís', 54);
pkg_community.createCommunity('Mata de Plátano', 55);
pkg_community.createCommunity('Purral', 56);
pkg_community.createCommunity('Rancho Redondo', 57);
pkg_community.createCommunity('San Francisco', 58);
pkg_community.createCommunity('San Pablo', 59);
pkg_community.createCommunity('San Andrés', 60);
pkg_community.createCommunity('Llano Bonito', 61);
pkg_community.createCommunity('San Isidro', 62);
pkg_community.createCommunity('Santa Cruz', 63);
pkg_community.createCommunity('San Antonio', 64);
pkg_community.createCommunity('Mercedes', 65);
pkg_community.createCommunity('Sabanilla', 66);
pkg_community.createCommunity('San Pedro', 67);
pkg_community.createCommunity('San Rafael', 68);
pkg_community.createCommunity('Ciudad Colón', 69);
pkg_community.createCommunity('Guayabo', 70);
pkg_community.createCommunity('Jaris', 71);
pkg_community.createCommunity('Picagres', 72);
pkg_community.createCommunity('Piedras Negras', 73);
pkg_community.createCommunity('Tabarcia', 74);
pkg_community.createCommunity('San Jerónimo', 75);
pkg_community.createCommunity('San Vicente', 76);
pkg_community.createCommunity('Trinidad', 77);
pkg_community.createCommunity('San Isidro de El General', 78);
pkg_community.createCommunity('Barú', 79);
pkg_community.createCommunity('Cajón', 80);
pkg_community.createCommunity('Daniel Flores', 81);
pkg_community.createCommunity('El General', 82);
pkg_community.createCommunity('La Amistad', 83);
pkg_community.createCommunity('Páramo', 84);
pkg_community.createCommunity('Pejibaye', 85);
pkg_community.createCommunity('Platanares', 86);
pkg_community.createCommunity('Río Nuevo', 87);
pkg_community.createCommunity('Rivas', 88);
pkg_community.createCommunity('San Pedro', 89);
pkg_community.createCommunity('Barbacoas', 90);
pkg_community.createCommunity('Candelarita', 91);
pkg_community.createCommunity('Chires', 92);
pkg_community.createCommunity('Desamparaditos', 93);
pkg_community.createCommunity('Grifo Alto', 94);
pkg_community.createCommunity('Mercedes Sur', 95);
pkg_community.createCommunity('San Antonio', 96);
pkg_community.createCommunity('San Rafael', 97);
pkg_community.createCommunity('Santiago', 98);
pkg_community.createCommunity('Brasil', 99);
pkg_community.createCommunity('Piedades', 100);
pkg_community.createCommunity('Pozos', 101);
pkg_community.createCommunity('Salitral', 102);
pkg_community.createCommunity('Santa Ana', 103);
pkg_community.createCommunity('Uruca', 104);
pkg_community.createCommunity('San Carlos', 105);
pkg_community.createCommunity('San Lorenzo', 106);
pkg_community.createCommunity('San Marcos', 107);
pkg_community.createCommunity('Anselmo Llorente', 108);
pkg_community.createCommunity('Cinco Esquinas', 109);
pkg_community.createCommunity('Colima', 110);
pkg_community.createCommunity('León XIII', 111);
pkg_community.createCommunity('San Juan', 112);
pkg_community.createCommunity('Carara', 113);
pkg_community.createCommunity('San Juan de Mata', 114);
pkg_community.createCommunity('San Luis', 115);
pkg_community.createCommunity('San Pablo', 116);
pkg_community.createCommunity('San Pedro', 117);
pkg_community.createCommunity('Cascajal', 118);
pkg_community.createCommunity('Dulce Nombre de Jesús', 119);
pkg_community.createCommunity('Patalillo', 120);
pkg_community.createCommunity('San Isidro', 121);
pkg_community.createCommunity('San Rafael', 122);
END;
--user types
BEGIN
    pkg_user_type.createusertype('Administrator');
    pkg_user_type.createusertype('User');
END;

BEGIN
    --CATEGORIES--
    pkg_category.createCategory('Medio ambiente');
    pkg_category.createCategory('Cultura');
    pkg_category.createCategory('Deportes');
    pkg_category.createCategory('Movilidad urbana');
    pkg_category.createCategory('Seguridad');
    pkg_category.createCategory('Salud y bienestar');
    pkg_category.createCategory('Espacio público');
    pkg_category.createCategory('Protección animal');
    pkg_category.createCategory('Educación');
    pkg_category.createCategory('Infancia y juventud');
    pkg_category.createCategory('Empleo');

    --NATIONALITIES--
    pkg_nationality.createNationality('alemana');
    pkg_nationality.createNationality('árabe');
    pkg_nationality.createNationality('argentina');
    pkg_nationality.createNationality('australiana');
    pkg_nationality.createNationality('belga');
    pkg_nationality.createNationality('boliviana');
    pkg_nationality.createNationality('brasileña');
    pkg_nationality.createNationality('canadiense');
    pkg_nationality.createNationality('chilena');
    pkg_nationality.createNationality('china');
    pkg_nationality.createNationality('colombiana');
    pkg_nationality.createNationality('coreana');
    pkg_nationality.createNationality('costarricense');
    pkg_nationality.createNationality('española');
    pkg_nationality.createNationality('estadounidense');
    pkg_nationality.createNationality('estonia');
    pkg_nationality.createNationality('etiope');
    pkg_nationality.createNationality('filipina');
    pkg_nationality.createNationality('finlandesa');
    pkg_nationality.createNationality('francesa');
    pkg_nationality.createNationality('galesa');
    pkg_nationality.createNationality('griega');
    pkg_nationality.createNationality('guatemalteca');
    pkg_nationality.createNationality('haitiana');
    pkg_nationality.createNationality('holandesa');
    pkg_nationality.createNationality('hondureña');
    pkg_nationality.createNationality('indonesa');
    pkg_nationality.createNationality('inglesa');
    pkg_nationality.createNationality('iraquí');
    pkg_nationality.createNationality('iraní');
    pkg_nationality.createNationality('irlandesa');
    pkg_nationality.createNationality('israelí');
    pkg_nationality.createNationality('italiana');
    pkg_nationality.createNationality('japonesa');
    pkg_nationality.createNationality('mexicana');
    pkg_nationality.createNationality('nicaragüense');
    pkg_nationality.createNationality('noruego');
    pkg_nationality.createNationality('neozelandesa');
    pkg_nationality.createNationality('panameña');
    pkg_nationality.createNationality('paraguaya');
    pkg_nationality.createNationality('peruana');
    pkg_nationality.createNationality('polaca');
    pkg_nationality.createNationality('portuguesa');
    pkg_nationality.createNationality('puertorriqueña');
    pkg_nationality.createNationality('dominicana');
    pkg_nationality.createNationality('rumana');
    pkg_nationality.createNationality('rusa');
    pkg_nationality.createNationality('sueca');
    pkg_nationality.createNationality('suiza');
    pkg_nationality.createNationality('tailandesa');
    pkg_nationality.createNationality('taiwanesa');
    pkg_nationality.createNationality('turca');
    pkg_nationality.createNationality('ucraniana');
    pkg_nationality.createNationality('uruguaya');
    pkg_nationality.createNationality('venezolana');
    pkg_nationality.createNationality('vietnamita');
    --PERSONS--
    pkg_person.insertPerson(305270927,'Lindsay','Morales','Bonilla','15/10/2000','fotoLin.png',2);
    pkg_person.insertPerson(117810292,'Paula','Chaves','Alvarado','16/06/2000','fotoPau.png',3);
    pkg_person.insertPerson(190827600,'Diana','Martínez','Sánchez','01/12/1995','fotoDiana.png',7);
    pkg_person.insertPerson(309300576,'Gabriel','Morales','Chaves','10/03/1997','fotoGab.png',9);
    pkg_person.insertPerson(305900567,'Harold','Arrieta','Vargas','12/09/1970','fotoHar.png',6);
    pkg_person.insertPerson(302500999,'Luis','Meneses','Fonseca','23/08/1965','fotoLuis.png',4);
    pkg_person.insertPerson(705270988,'Jennifer','Corrales','Aguilar','07/02/1993','fotoJen.png',1);
    pkg_person.insertPerson(901230995,'Marta','Chacón','Gutiérrez','17/11/1969','fotoMar.png',8);
    pkg_person.insertPerson(190872345,'Laura','Calvo','Fernández','11/02/1977','fotoLau.png',2);
    pkg_person.insertPerson(801230965,'Jose','Estrada','Shum','12/12/1980','fotoJose.png',10);
    pkg_person.insertPerson(902340877,'Ricardo','Víquez','Benavides','22/09/1985','fotoRich.png',15);
    pkg_person.insertPerson(198765432,'Esteban','Cerdas','Flores','31/07/1975','fotoEst.png',2);
    pkg_person.insertPerson(309280999,'Victoria','Smith','Sauter','29/03/2001','fotoVic.png',10);
    pkg_person.insertPerson(802340987,'Valeria','Mesén','Zamora','02/02/1999','fotoVal.png',5);
    pkg_person.insertPerson(304560912,'Andrey','Gallardo','Elizondo','13/11/1991','fotoAndrey.png',8);
    pkg_person.insertPerson(190872345,'Mariana','Arce','Vega','12/12/1979','fotoMari.png',5);
    pkg_person.insertPerson(109870222,'Verónica','Nuñez','Moya','07/08/2000','fotoVero.png',6);
    pkg_person.insertPerson(190872345,'Leonardo','Figueroa','Torres','11/12/1983','fotoLeo.png',13);
    pkg_person.insertPerson(902390871,'Alberto','Coto','Barrantes','16/10/1988','fotoBeto.png',3);
    pkg_person.insertPerson(409820342,'Daniela','Hernández','Ramírez','19/05/2000','fotoDani.png',9);
    pkg_person.insertPerson(119023874,'Douglas','Passapera','Carvajal','18/09/1989','fotoDou.png',12);
    --USERS--
    pkg_user.insertUser('Admin01',0,0,'lindsaymb');
    pkg_user.insertUser('Hachu16',1,0,'mapac');
    pkg_user.insertUser('Dicacha90',2,1,'dianachav');
    pkg_user.insertUser('Gab03',3,1,'gabo1003');
    pkg_user.insertUser('hav00',4,1,'haroldav');
    pkg_user.insertUser('luis99',5,1,'luiskmen');
    pkg_user.insertUser('jen01',6,1,'jenny_cor');
    pkg_user.insertUser('mcg1212',7,1,'martachac');
    pkg_user.insertUser('lauca',8,1,'laucalfons11');
    pkg_user.insertUser('jest',9,1,'joseshum');
    pkg_user.insertUser('ric9912',10,1,'ricardoviq');
    pkg_user.insertUser('este00',11,1,'cerdasflores');
    pkg_user.insertUser('victo01',12,1,'vickyss');
    pkg_user.insertUser('vzm99',13,1,'valzam89');
    pkg_user.insertUser('andrgall',14,1,'gallardoe');
    pkg_user.insertUser('mav79',15,1,'marianaarc');
    pkg_user.insertUser('vnm00',16,1,'veronuñez12');
    pkg_user.insertUser('leo9012',17,1,'figueleo');
    pkg_user.insertUser('Habet81',18,1,'betocoba');
    pkg_user.insertUser('pizaju34',19,1,'danihernan');
    pkg_user.insertUser('dou92',20,1,'89passapera');
    --TELEPHONES--
    pkg_telephone(84946665,0);  
    pkg_telephone(86362856,1);
    pkg_telephone(89326732,2);
    pkg_telephone(67893245,3);
    pkg_telephone(89894589,4);
    pkg_telephone(78902345,5);
    pkg_telephone(88674533,6);
    pkg_telephone(88223378,7);
    pkg_telephone(87512238,8);
    pkg_telephone(65539012,9);
    pkg_telephone(88231242,10);
    pkg_telephone(75689012,11);
    pkg_telephone(67890012,12);
    pkg_telephone(89126732,13);
    pkg_telephone(85639011,14);
    pkg_telephone(73249012,15);
    pkg_telephone(89765432,16);
    pkg_telephone(88906672,17);
    pkg_telephone(78902344,18);
    pkg_telephone(81908752,19);
    pkg_telephone(67230012,20);
    --EMAILS--
    
    --CATEGORIES X PERSON--
END;

--usuarios ejemplo
BEGIN
    pkg_user.registerUser(123456, 'Hans', 'Fernandez', 'Murillo', '22/10/1998', 'fotoHan.png', 10,
                          'tentz2210', '123456', 2, 'ejemplo3@ejm.com', 88060199, 13);
    pkg_user.registerUser(305270927,'Lindsay','Morales','Bonilla','15/10/2000','fotoLin.png', 20, 
                          'Admin01', 'lindsaymb', 1, 'ejemplo1@ejm.com', 84946665,13);
    pkg_user.registerUser(117810292,'Paula','Chaves','Alvarado','16/06/2000','fotoPau.png', 21, 
                          'Hachu16', 'mapac', 2, 'ejemplo2@ejm.com', 86362856, 13);
END;

--Prueba login
DECLARE
    login_result NUMBER(1);
    pid_user NUMBER(10);
BEGIN
    pkg_user.checkLogin('tentz2210', '123456', pid_user, login_result);
    DBMS_OUTPUT.PUT_LINE(login_result||': '||pid_user);
END;

--Prueba obtener las provincias del pais
DECLARE
    cursorAux SYS_REFCURSOR;
    vid_country NUMBER(8);
    vcountry_name VARCHAR(30);
BEGIN
    pkg_province.getProvincesFromCountry(1, cursorAux);
    LOOP 
        FETCH cursorAux INTO vid_country, vcountry_name;
        EXIT WHEN cursorAux%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(vid_country||': '||vcountry_name);
    END LOOP;
    CLOSE cursorAux;
END;
