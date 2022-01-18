select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_address a,customer_demographics cd,ship_mode sm
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and a.ca_hash >= 19 and a.ca_hash <= 769 and cd.cd_hash >= 230 and cd.cd_hash <= 563 and sm.sm_hash >= 38 and sm.sm_hash <= 438
;
