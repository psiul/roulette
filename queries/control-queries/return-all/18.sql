select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer c,customer_address a,catalog_returns cr
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 298 and cs.cs_hash <= 631 and sm.sm_hash >= 161 and sm.sm_hash <= 911 and c.c_hash >= 404 and c.c_hash <= 804
;
