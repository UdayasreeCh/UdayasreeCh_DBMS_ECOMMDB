-- Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
SELECT COUNT(1), C.CUS_GENDER FROM ORD O, CUSTOMER C WHERE O.CUS_ID = C.CUS_ID AND O.ORD_AMT >=3000 GROUP BY C.CUS_GENDER;

-- Display all the orders along with product name ordered by a customer having Customer_Id=2
SELECT PROD.PRO_ID, PROD.PRO_NAME,PROD.PRO_DESC FROM PRODUCT PROD WHERE PROD.PRO_ID IN( SELECT SP.PRO_ID FROM SUPPLIER_PRICING SP, (SELECT O.PRICING_ID FROM ORD O, CUSTOMER C WHERE O.CUS_ID = C.CUS_ID AND C.CUS_ID = 2 ) ORDER1 WHERE ORDER1.PRICING_ID = SP.PRICING_ID  );

-- Display the Supplier details who can supply more than one product
SELECT S.SUPP_ID,(select sp.supp_name from supplier sp where sp.supp_id = s.supp_id),concat(COUNT(S.SUPP_ID),' Products') prodcount FROM SUPPLIER_PRICING S GROUP BY S.SUPP_ID HAVING COUNT(S.SUPP_ID) > 1;

-- Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select p.id, p.name,min(p.pro_name) ,min(p.prod_price) from (SELECT CAT.CAT_ID ID, CAT.CAT_NAME Name, pro_name,
(select sp.supp_price from supplier_pricing sp where sp.pro_id = prd.pro_id  ) prod_price
FROM CATEGORY CAT, product prd where prd.cat_id = cat.cat_id )p group by p.id,p.name;


-- Display the Id and Name of the Product ordered after “2021-10-05”.
SELECT P.PRO_ID,P.PRO_NAME FROM PRODUCT P, SUPPLIER_PRICING SP WHERE P.PRO_ID = SP.PRO_ID AND SP.PRICING_ID IN (   SELECT PRICING_ID FROM ORD WHERE ORD_DATE >'2021-10-05');


-- 	Display customer name and gender whose names start or end with character 'A'.

SELECT CUS_NAME, CUS_GENDER from customer  WHERE (CUS_NAME LIKE 'A%'  OR CUS_NAME LIKE '%A');

/*Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
*/












