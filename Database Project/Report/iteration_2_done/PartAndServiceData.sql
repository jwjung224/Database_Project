
-- Matt's initial version for SERVICE, PART, and SERVICE_PARTS


INSERT INTO SERVICE VALUE
(1, 'Tire repair', 'Miscellaneous', 10, 0.5);
INSERT INTO PART VALUE(1, 'Rubber patch'/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE (1 /*service id*/, 1/*part id*/, 1/*quantity*/);

INSERT INTO SERVICE VALUE
(NULL, 'Tire replacement', 'Replacement', 1000, 2.0);
INSERT INTO PART VALUE(2/*part id*/, 'All weather tire'/*desc*/,''/*type*/, 105.98/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE (2 /*service id*/, 2/*part id*/, 4/*quantity*/);

INSERT INTO SERVICE VALUE
(NULL, 'Wheel alignment', 'Tune up', 150, 1);

INSERT INTO SERVICE VALUE
(NULL, 'Wiper blade replacement', 'Replacement', 100, 0.5);
INSERT INTO PART VALUE(3 /*part id*/, 'Front Wiper Blade'/*desc*/,''/*type*/, 24.50/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE (3 /*service id*/, 3/*part id*/, 2/*quantity*/);
INSERT INTO PART VALUE(4 /*part id*/, 'Rear Wiper Blade'/*desc*/,''/*type*/, 18.50/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE (3 /*service id*/, 4/*part id*/, 1/*quantity*/);

INSERT INTO SERVICE VALUE
(NULL, 'Windshield replacement', 'Replacement', 500, 2);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Check engine light diagnosis', 'Tune up', 20, 0.5);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Engine oil change', 'Replacement', 100, 1);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Coolant flushing', 'Replacement', 150, 1);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Transmission replacement', 'Replacement', 4000, 24);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Transmission oil change', 'Replacement', 100, 1);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Break fluid change', 'Replacement', 100, 1);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Highbeam lightbulb change', 'Replacement', 100, 3);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Paint Body', 'Micellaneous', 4000, 72);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Refill windshield washer', 'Micellaneous', 20, 0.25);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'A/C repair', 'Repair', 200, 3);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Break pad replacement', 'Replacement', 500, 4);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Timing belt diagnosis', 'Tune up', 50, 1);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Timing belt replacement', 'Replacement', 800, 4);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Emission repair', 'Repair', 300, 5);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Fuel injection replacement', 'Replacement', 300, 3);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Engine replacement', 'Replacement', 5000, 96);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Starter replacement', 'Replacement', 600, 5);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Catalytic converters repair', 'Repair', 500, 4);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Master cylinder repair', 'Repair', 1000, 8);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Wheel balancing', 'Micellaneous', 50, 1);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Emergency brake repair', 'Repair', 300, 5);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Power steering repair', 'Repair', 100, 2);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Power steering fluid replacement', 'Replacement', 100, 1);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, '30k maintenance', 'Tune up', 300, 4);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, '60k maintenance', 'Tune up', 200, 4);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, '90k maintenance', 'Tune up', 200, 4);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Audio repair', 'Repair', 100, 2);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Navigation repair', 'Repair', 300, 4);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Navigation update', 'Micellaneous', 50, 0.5);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'A/C refrigerant refill', 'Repair', 50, 1);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Break rotor replacement', 'Replacement', 600, 5);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Break drum replacement', 'Replacement', 800, 5);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Electrical wiring diagnosis', 'Tune up', 50, 1);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Crankshaft replacement', 'Replacement', 500, 4);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


INSERT INTO SERVICE VALUE
(NULL, 'Valve adjustment', 'Repair', 100, 2);
INSERT INTO PART VALUE( /*part id*/, ''/*desc*/,''/*type*/, 0.0/*cost*/, 1/*vendor id*/);
INSERT INTO SERVICE_PARTS VALUE ( /*service id*/, /*part id*/, 1/*quantity*/);


