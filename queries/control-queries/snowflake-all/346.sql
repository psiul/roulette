select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_address a,household_demographics hd,ship_mode sm
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 518 and cs.cs_hash <= 918 and c.c_hash >= 177 and c.c_hash <= 927 and sm.sm_hash >= 3 and sm.sm_hash <= 336
;
