INSERT INTO DEALERSHIP VALUES
(1001, 'Seattle Ford', 1000001, '888-456-2345', 1001),
(1002, 'Bellevue Ford', 1234567, '888-345-2045', 2002),
(1003, 'Tacoma Ford', 1357913, '888-311-6424', 3003),
(1004, 'Spokane Ford', 4567890, '888-567-2356', 4004),
(1005, 'Olympia Ford', 2345678, '888-124-0928', 5005),
(1006, 'Lynnwood Ford', 1749202, '888-767-8432', 6006),
(1007, 'Everett Ford', 1999032, '888-825-2093', 7007),
(1008, 'Kelso Ford', 3029423, '888-554-3882', 8008),
(1009, 'Yakima Ford', 9837291, '888-241-9123', 9009),
(1010, 'Renton Ford', 5023456, '888-723-0194', 1010); 


INSERT INTO VENDOR VALUES
(1, 'Best tire', 2340232, '206-888-2342'),
(2, 'Nice metal', 1110532, '206-293-4449'),
(3, 'Speedy glass', 5550444, '425-123-0001'),
(4, 'Zero enterprise', 1000234, '253-567-3943'),
(5, 'Bright light', 7834234, '360-343-3432'),
(6, 'Cheap autopart', 1000200, '206-432-1239'),
(7, 'Better batteries', 3012034, '206-203-9532'),
(8, 'Sensor factory', 1112303, '253-023-9142'),
(9, 'Zebra shade', 5304230, '360-233-2456'),
(10, 'Quick clean supply', 8029321, '206-189-2939'),
(11, 'Step used tire', 2001234, '509-234-2912'),
(12, 'Audio world', 9083753, '206-391-2934'),
(13, 'America hardware', 2005234, '206-304-3959'),
(14, 'Most important engine', 5034023, '206-939-9392'),
(15, 'Used part specialist', 3334234, '253-222-9898'),
(16, 'All about paint', 4093823, '360-874-3124'),
(17, 'Transmission depot', 2345672, '253-199-2934'),
(18, 'Bolt & nuts', 7703463, '425-345-2195'),
(19, 'Bulb and more', 9302343, '425-670-0938'),
(20, 'More oils', 8203944, '206-456-2934');


INSERT INTO SERVICE VALUES
(1001, 'Tire repair', 'Micellaneous', 10, 0.5),
(1002, 'Tire replacement', 'Replacement', 1000, 2),
(1003, 'Wheel alignment', 'Tune up', 150, 1),
(1004, 'Wiper blade replacement', 'Replacement', 100, 0.5),
(1005, 'Windshield replacement', 'Replacement', 500, 2),
(1006, 'Check engine light diagnosis', 'Tune up', 20, 0.5),
(1007, 'Engine oil change', 'Replacement', 100, 1),
(1008, 'Coolant flushing', 'Replacement', 150, 1),
(1024, 'Transmission replacement', 'Replacement', 4000, 24),
(1010, 'Transmission oil change', 'Replacement', 100, 1),
(1011, 'Break fluid change', 'Replacement', 100, 1),
(1012, 'Highbeam lighbulb change', 'Replacement', 100, 3),
(1013, 'Paint Body', 'Micellaneous', 4000, 72),
(1014, 'Refill windshield washer', 'Micellaneous', 20, 0.25),
(1015, 'A/C repair', 'Repair', 200, 3),
(1016, 'Break pad replacement', 'Replacement', 500, 4),
(1017, 'Timing belt diagnosis', 'Tune up', 50, 1),
(1018, 'Timing belt replacement', 'Replacement', 800, 4),
(1019, 'Emission repair', 'Repair', 300, 5),
(1020, 'Fuel injection replacement', 'Replacement', 300, 3),
(1021, 'Engine replacement', 'Replacement', 5000, 96),
(1022, 'Starter replacement', 'Replacement', 600, 5),
(1023, 'Catalytic converters repair', 'Repair', 500, 4),
(1024, 'Master cylinder repair', 'Repair', 1000, 8),
(1025, 'Wheel balancing', 'Micellaneous', 50, 1),
(1026, 'Emergency brake repair', 'Repair', 300, 5),
(1027, 'Power steering repair', 'Repair', 100, 2),
(1028, 'Power steering fluid replacement', 'Replacement', 100, 1),
(1029, '30k maintenance', 'Tune up', 300, 4),
(1030, '60k maintenance', 'Tune up', 200, 4),
(1031, '90k maintenance', 'Tune up', 200, 4),
(1032, 'Audio repair', 'Repair', 100, 2),
(1033, 'Navigation repair', 'Repair', 300, 4),
(1034, 'Navigation update', 'Micellaneous', 50, 0.5),
(1035, 'A/C refrigerant refill', 'Repair', 50, 1),
(1036, 'Break rotor replacement', 'Replacement', 600, 5),
(1037, 'Break drum replacement', 'Replacement', 800, 5),
(1038, 'Electrical wiring diagnosis', 'Tune up', 50, 1),
(1039, 'Crankshaft replacement', 'Replacement', 500, 4),
(1040, 'Valve adjustment', 'Repair', 100, 2);

INSERT INTO PART VALUES
(1219200, 'Battery', 'Battery', 100, 7),
(1219205, 'Battery terminal', 'Battery', 15, 2),
(1219212, 'Battery plate', 'Battery', 5, 2),
(1219219, 'Insulator', 'Battery', 50, 2),
(2012345, 'Windshield front glass', 'Body', 300, 3),
(2012567, 'Room mirror', 'Body', 50, 3),
(2012350, 'Windshield back glass', 'Body', 500, 3),
(2012375, 'Side mirror driver', 'Body', 70, 3),
(2012377, 'Side mirror passenger', 'Body', 70, 3),
(2012388, 'Roof mirror', 'Body', 250, 3),
(2102303, 'Windshield wiperblade 14inch', 'Body',20, 6),
(2102304, 'Windshield wiperblade 15inch', 'Body',20, 6),
(2102305, 'Windshield wiperblade 16inch', 'Body',20, 6),
(2102306, 'Windshield wiperblade 17inch', 'Body',20, 6),
(2102307, 'Windshield wiperblade 18inch', 'Body',20, 6),
(2102308, 'Windshield wiperblade 19inch', 'Body',20, 6),
(2102309, 'Windshield wiperblade 20inch', 'Body',20, 6),
(2102310, 'Windshield wiperblade 21inch', 'Body',22, 6),
(2102311, 'Windshield wiperblade 22inch', 'Body',22, 6),
(2102312, 'Windshield wiperblade 23inch', 'Body',22, 6),
(2102313, 'Windshield wiperblade 24inch', 'Body',22, 6),
(2102314, 'Windshield wiperblade 25inch', 'Body',22, 6),
(2200001, 'Windshield washer fluid', 'Fluid', 5, 6),
(2056775, 'Headlight left', 'Body', 400, 5),
(2056776, 'Headlight right', 'Body', 300, 5),
(2056880, 'Taillight left', 'Body', 400, 5),
(2056881, 'Taillight right', 'Body', 300, 5),
(2057000, 'Headlight bulb left', 'Electrical', 20, 19),
(2057001, 'Headlight bulb right', 'Electrical', 20, 19),
(2057200, 'Taillight bulb left', 'Electrical', 10, 19),
(2057201, 'Taillight bulb right', 'Electrical', 10, 19),
(2057210, 'Highbeam bulb left', 'Electrical', 10, 19),
(2057211, 'Highbeam bulb right', 'Electrical', 10, 19),
(2057220, 'Taillight break bulb left', 'Electrical', 10, 19),
(2057221, 'Taillight break bulb right', 'Electrical', 10, 19),
(3111033, 'Engine', 'Engine', 10000, 14),
(3113145, 'Alternator', 'Engine', 1100, 14),
(3113199, 'Water Pump', 'Engine', 870, 14),
(3113292, 'Camshaft', 'Engine', 500, 14),
(3113300, 'Tensioner', 'Engine', 550, 14),
(3113301, 'Fuel injector', 'Engine', 25, 14),
(3113305, 'Fuel injection gasket', 'Engine', 90, 14),
(3113324, 'Crankshaft', 'Engine', 1000, 14),
(3113344, 'Crankshaft Bearing set', 'Engine', 50, 14),
(3113884, 'Crankshaft cover', 'Engine', 50, 2),
(3114111, 'Flywheel', 'Engine', 1500, 14),
(3114375, 'Cylinder', 'Engine', 1500, 14),
(3114519, 'Piston', 'Engine', 20, 14),
(3115093, 'Ventilation hose', 'Engine', 20, 14),
(3116034, 'Spart Plug', 'Engine', 50, 14),
(3117420, 'Starter', 'Engine', 400, 14),
(3222200, 'Timing belt', 'Engine', 500, 6),
(3300101, 'Engine oil 0W20', 'fluid', 2, 20),
(3300102, 'Engine oil 5W20', 'fluid', 2, 20),
(3300103, 'Engine oil 5W30', 'fluid', 2, 20),
(3300104, 'Engine oil 10W30', 'fluid', 2, 20),
(3300105, 'Engine oil 10W40', 'fluid', 2, 20),
(3300999, 'Engine oil filter', 'Engine', 10, 6),
(3330001, 'Coolant fluid', 'fluid', 20, 6), 
(3330100, 'Break oil', 'Fluid', 20, 6),
(3999001, 'Tansmission', 'Transmission', 3500, 17),
(3999099, 'Transmission oil', 'Fluid', 30, 6),
(4000108, 'Break Pad', 'Break', 50, 6),
(4000209, 'Break Rotor', 'Break', 100, 6),
(4000210, 'Break Drum', 'Break', 200, 6),
(4500001, 'Powersteering fluid', 'Fluid', 30, 6),
(7000000, 'A/C refrigerant', 'A/C', 50, 6),
(8000120, 'P185R50', 'Tire', 95, 1),
(8000121, 'P185R60', 'Tire', 95, 1),
(8000120, 'P195R50', 'Tire', 100, 1),
(8000123, 'P195R60', 'Tire', 100, 1),
(8000125, 'P205R50', 'Tire', 105, 1),
(8000127, 'P205R60', 'Tire', 105, 1),
(8000999, 'Rubber patch', 'Tire', 2, 1),
(8002000, 'Wheel balancer', 'Tire', 10, 6),
(9999001, 'Audio wire', 'Misc', 1, 12);



INSERT INTO SERVICE VALUE
(1001, 'Tire repair', 'Miscellaneous', 10, 0.5);
INSERT INTO SERVICE_PARTS VALUE (1001, 8000999, 1);


INSERT INTO SERVICE VALUE
(1002, 'Tire replacement', 'Replacement', 1000, 2.0);
INSERT INTO SERVICE_PARTS VALUE (1002, 8000127, 4);


INSERT INTO SERVICE VALUE 
(1003, 'Wheel alignment', 'Tune up', 150, 1);


INSERT INTO SERVICE VALUE
(1004, 'Wiper blade replacement', 'Replacement', 100, 0.5);
INSERT INTO SERVICE_PARTS VALUE 
(1004, 2102305, 1),
(1004, 2102314, 1);


INSERT INTO SERVICE VALUE
(1005, 'Windshield replacement', 'Replacement', 500, 2);
INSERT INTO SERVICE_PARTS VALUE 
(1005, 2012345, 1);


INSERT INTO SERVICE VALUE
(1006, 'Check engine light diagnosis', 'Tune up', 20, 0.5);


INSERT INTO SERVICE VALUE
(1007, 'Engine oil change', 'Replacement', 100, 1);
INSERT INTO SERVICE_PARTS VALUE 
(1007, 33300104, 5),
(1007, 3330999, 1);


INSERT INTO SERVICE VALUE
(1008, 'Coolant flushing', 'Replacement', 150, 1);
INSERT INTO SERVICE_PARTS VALUE 
(1008, 3330001, 1);


INSERT INTO SERVICE VALUE
(1009, 'Transmission replacement', 'Replacement', 4000, 24);
INSERT INTO SERVICE_PARTS VALUE 
(1009, 3999001, 1);


INSERT INTO SERVICE VALUE
(1010, 'Transmission oil change', 'Replacement', 100, 1);
INSERT INTO SERVICE_PARTS VALUE 
(1010, 3999099, 1);


INSERT INTO SERVICE VALUE
(1011, 'Break fluid change', 'Replacement', 100, 1);
INSERT INTO SERVICE_PARTS VALUE 
(1011, 3330100, 1);


INSERT INTO SERVICE VALUE
(1012, 'Highbeam lighbulb change', 'Replacement', 100, 3);
INSERT INTO SERVICE_PARTS VALUE 
(1012, 2057211, 1);


INSERT INTO SERVICE VALUE
(1013, 'Paint Body', 'Micellaneous', 4000, 72);


INSERT INTO SERVICE VALUE
(1014, 'Refill windshield washer', 'Micellaneous', 20, 0.25);
INSERT INTO SERVICE_PARTS VALUE 
(1014, 2200001, 1);


INSERT INTO SERVICE VALUE
(1015, 'A/C repair', 'Repair', 200, 3);


INSERT INTO SERVICE VALUE
(1016, 'Break pad replacement', 'Replacement', 500, 4);
INSERT INTO SERVICE_PARTS VALUE 
(1016, 4000108, 4);


INSERT INTO SERVICE VALUE
(1017, 'Timing belt diagnosis', 'Tune up', 50, 1);


INSERT INTO SERVICE VALUE
(1018, 'Timing belt replacement', 'Replacement', 800, 4);
INSERT INTO SERVICE_PARTS VALUE 
(1018, 3222200, 1);


INSERT INTO SERVICE VALUE
(1019, 'Emission repair', 'Repair', 300, 5);


INSERT INTO SERVICE VALUE
(1020, 'Fuel injector replacement', 'Replacement', 300, 3);
INSERT INTO SERVICE_PARTS VALUE 
(1020, 3113301, 1);


INSERT INTO SERVICE VALUE
(1021, 'Engine replacement', 'Replacement', 5000, 96);
INSERT INTO SERVICE_PARTS VALUE 
(1021, 3111033, 1);


INSERT INTO SERVICE VALUE
(1022, 'Starter replacement', 'Replacement', 600, 5);
INSERT INTO SERVICE_PARTS VALUE 
(1022, 3117420, 1);


INSERT INTO SERVICE VALUE
(1023, 'Catalytic converters repair', 'Repair', 500, 4);


INSERT INTO SERVICE VALUE
(1024, 'Master cylinder repair', 'Repair', 1000, 8);
INSERT INTO SERVICE_PARTS VALUE 
(1024, 3114375, 1);


INSERT INTO SERVICE VALUE
(1025, 'Wheel balancing', 'Micellaneous', 50, 1);
INSERT INTO SERVICE_PARTS VALUE 
(1025, 8002000, 4);


INSERT INTO SERVICE VALUE
(1026, 'Emergency brake repair', 'Repair', 300, 5);


INSERT INTO SERVICE VALUE
(1027, 'Power steering repair', 'Repair', 100, 2);


INSERT INTO SERVICE VALUE
(1028, 'Power steering fluid replacement', 'Replacement', 100, 1);
INSERT INTO SERVICE_PARTS VALUE 
(1028, 4500001, 1);


INSERT INTO SERVICE VALUE
(1029, '30k maintenance', 'Tune up', 300, 4);


INSERT INTO SERVICE VALUE
(1030, '60k maintenance', 'Tune up', 200, 4);


INSERT INTO SERVICE VALUE
(1031, '90k maintenance', 'Tune up', 200, 4);


INSERT INTO SERVICE VALUE
(1032, 'Audio repair', 'Repair', 100, 2);


INSERT INTO SERVICE VALUE
(1033, 'Navigation repair', 'Repair', 300, 4);
INSERT INTO SERVICE_PARTS VALUE 
(1033, 9999001, 1);

INSERT INTO SERVICE VALUE
(1034, 'Navigation update', 'Micellaneous', 50, 0.5);


INSERT INTO SERVICE VALUE
(1035, 'A/C refrigerant refill', 'Repair', 50, 1);
INSERT INTO SERVICE_PARTS VALUE 
(1035, 7000000, 1);


INSERT INTO SERVICE VALUE
(1036, 'Break rotor replacement', 'Replacement', 600, 5);
INSERT INTO SERVICE_PARTS VALUE 
(1036, 4000209, 1);


INSERT INTO SERVICE VALUE
(1037, 'Break drum replacement', 'Replacement', 800, 5);
INSERT INTO SERVICE_PARTS VALUE 
(1038, 4000210, 1);


INSERT INTO SERVICE VALUE
(1039, 'Electrical wiring diagnosis', 'Tune up', 50, 1);


INSERT INTO SERVICE VALUE
(1040, 'Crankshaft replacement', 'Replacement', 500, 4);
INSERT INTO SERVICE_PARTS VALUE 
(1040, 3113324, 1);


INSERT INTO SERVICE VALUE
(0, 'Valve adjustment', 'Repair', 100, 2);
