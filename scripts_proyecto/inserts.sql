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
