select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,ship_mode sm,customer_address a
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 46 and cs.cs_hash <= 379 and c.c_hash >= 155 and c.c_hash <= 905 and sm.sm_hash >= 108 and sm.sm_hash <= 508
;
