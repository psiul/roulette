select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,customer c,customer_address a
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 19 and cs.cs_hash <= 419 and sm.sm_hash >= 621 and sm.sm_hash <= 954 and d.d_hash >= 171 and d.d_hash <= 921
;
