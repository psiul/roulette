select count(cs.cs_item_sk)
from catalog_sales cs,customer c,ship_mode sm,customer_address a,household_demographics hd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 139 and cs.cs_hash <= 889 and sm.sm_hash >= 263 and sm.sm_hash <= 663 and hd.hd_hash >= 231 and hd.hd_hash <= 564
;
