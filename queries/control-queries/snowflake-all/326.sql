select count(cs.cs_item_sk)
from catalog_sales cs,customer c,ship_mode sm,customer_address a,item i
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 197 and cs.cs_hash <= 947 and c.c_hash >= 551 and c.c_hash <= 884 and i.i_hash >= 251 and i.i_hash <= 651
;
