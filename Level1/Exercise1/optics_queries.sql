
SELECT * FROM opticsculdampolla.sale
         WHERE costumer_id = 1
           AND
             date < NOW();

SELECT glasses_id FROM opticsculdampolla.sale
         WHERE seller_employee_id = 2
           AND
             date > DATE_SUB(NOW(), INTERVAL 1 YEAR)
                 AND date < NOW();


SELECT glasses_id FROM opticsculdampolla.sale
                  JOIN opticsculdampolla.glasses g on g.id = sale.glasses_id
JOIN opticsculdampolla.brand b on b.id = g.brand_id
JOIN opticsculdampolla.supplier s on s.id = b.supplier_id;

SELECT DISTINCT opticsculdampolla.supplier.name
FROM opticsculdampolla.supplier
JOIN opticsculdampolla.brand
ON opticsculdampolla.supplier.id = brand.supplier_id
JOIN opticsculdampolla.glasses
ON opticsculdampolla.brand.id = glasses.brand_id
JOIN opticsculdampolla.sale
ON glasses.id = sale.glasses_id;