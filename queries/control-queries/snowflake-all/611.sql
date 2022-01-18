select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,customer c,customer_address a
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and sm.sm_hash >= 11 and sm.sm_hash <= 344 and c.c_hash >= 300 and c.c_hash <= 700 and a.ca_hash >= 2 and a.ca_hash <= 752
;
