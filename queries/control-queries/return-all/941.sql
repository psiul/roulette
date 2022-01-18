select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,customer_address a,ship_mode sm
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 170 and cs.cs_hash <= 920 and a.ca_hash >= 48 and a.ca_hash <= 448 and sm.sm_hash >= 231 and sm.sm_hash <= 564
;
