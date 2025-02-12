select *
from PRODUCT P
 join facility FC
on P.FACILITY_ID = FC.FACILITY_ID 
join inventory_item II
on II.PRODUCT_ID = P.PRODUCT_ID and II.FACILITY_ID = FC.FACILITY_ID 