CREATE DEFINER=`root`@`localhost` PROCEDURE `service_rating`()
BEGIN
select o.ord_id, o.pricing_id,sp.supp_id, supp.supp_id, r.rat_ratstars,
CASE
    WHEN r.rat_ratstars  = 5 THEN "Excellent
Service"
    WHEN r.rat_ratstars  =3 or r.rat_ratstars  =4 THEN "Good Service"
     WHEN r.rat_ratstars  =2 THEN "Average Service"
    ELSE "Poor Service"
END
from ord o, supplier_pricing sp,
 (select supp_id,supp_name from ECOMMDB.supplier) supp, rating r  where 
 sp.pricing_id = o.pricing_id and supp.supp_id = sp.supp_id  and r.ord_id = o.ord_id order by 1 ;


END