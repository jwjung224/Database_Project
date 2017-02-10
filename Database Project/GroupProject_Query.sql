/*
SELECT de.name AS 'Dealership', COUNT(em.employee_id) AS '# of Employee' 
FROM EMPLOYEE AS em, DEALERSHIP AS de
WHERE de.dealership_id = em.dealerShip_id AND de.name = 'Seattle Ford';
*/



/*
SELECT COUNT(em.employee_id) AS '# of Employee'
FROM EMPLOYEE AS em, DEALERSHIP AS de
WHERE de.Dealership_id = em.employee_id;
*/

/*
SELECT DISTINCT (em.employee_id), 
		em.f_name AS 'First Name',
		em.l_name AS 'Last Name',
		COUNT(sa.employee_id) AS '# of Car Sold', 
		Truncate(AVG (sa.sale_price),2) AS 'Average sold car price'
FROM SALE AS sa, EMPLOYEE AS em
WHERE sa.employee_id = em.employee_id
GROUP BY em.employee_id; 
*/

/*
SELECT de.name AS 'Available DealerShip',
	   ve.year_manufactured AS 'Year',
       ve.color AS 'Color',
	   COUNT(ve.vin) AS'Available Stock'  
FROM DEALERSHIP AS de, VEHICLE AS ve, 
	 VEHICLE_INVENTORY AS vein
WHERE ve.vin = vein.vin  AND ve.make = 'Mini' 
      AND de.dealership_id = vein.dealership_id
GROUP BY de.dealership_id;
*/

/*
SELECT pa.description AS 'Part name',
	   pain.quantity AS'Qty',
	   ve.name AS 'Vendor Name',
	   ve.phone_number AS 'Vendor Phone #' 
FROM PART AS pa, PART_INVENTORY AS pain, 
	 DEALERSHIP AS de, VENDOR AS ve
WHERE pa.part_id = pain.part_id 
      AND pain.quantity < 4
      AND de.dealership_id = pain.dealership_id
      AND de.name = 'Lynnwood Ford' 
      AND ve.vendor_id = pa.vendor_id
GROUP BY pa.description;
*/

/*
SELECT  em.f_name AS 'SalePerson First Name',
		em.l_name AS 'Last Name',
        MAX(sa.sale_price) AS 'Price Sold',
        sa.sale_date AS 'Purchased Date',
	    cu.f_name AS 'Customer First Name',
        cu.m_initial AS 'M.I.',
        cu.l_name AS 'Last Name'
FROM SALE AS sa,
	 EMPLOYEE AS em,
     DEALERSHIP AS de,
     CUSTOMER AS cu
WHERE sa.sale_date > '2013-01-01'
	  AND de.dealership_id = em.dealership_id
	  AND em.employee_id = sa.employee_id
      AND cu.customer_id = sa.customer_id;



SELECT MIN(vein.price) AS 'Cheapest Price Car',
	   de.name AS 'Dealership',
       de.phone_number AS 'Phone #',
       ad.street,
       ad.unit_number,
       ad.city,
       ad.state,
       ad.zip_code AS 'ZIP CODE'
FROM DEALERSHIP AS de,
	 ADDRESS AS ad,
     VEHICLE_INVENTORY AS vein
WHERE vein.dealership_id = de.dealership_id
	  AND de.address_id = ad.address_id;



SELECT * FROM service
WHERE stype = 'Tune up'
ORDER BY cost;


SELECT de.name AS 'Dealership',
	   COUNT(sere.service_id) AS '# of Serviced car'  
FROM SERVICE_RECORD AS sere,
	 DEALERSHIP AS de
WHERE sere.scheduled_date > '2015-06-01'
	  AND de.dealership_id = sere.dealership_id
GROUP BY de.name;
*/

SELECT em.F_name, em.L_name, em.Salary 
FROM DEALERSHIP AS de,
	 EMPLOYEE AS em
WHERE em.dealership_id = de.dealership_id
	  AND de.name = 'Bellevue Ford';
      
      
/* -- not included
SELECT ve.type, COUNT(ve.type)
FROM vehicle AS ve, vehicle_inventory AS vein
WHERE ve.vin = vein.vin
GROUP BY ve.type;
*/

SELECT * 
FROM SALE AS sa, VEHICLE AS ve
WHERE sa.vin = ve.vin -- AND ve.make = 'Ford' 
	AND ve.year_manufactured > 2000
LIKE ve.model = 'verona';
      


SELECT *
FROM SALE AS sa, VEHICLE AS ve
WHERE sa.vin = ve.vin;
