select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,item i,customer_address a
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 238 and cs.cs_hash <= 638 and c.c_hash >= 25 and c.c_hash <= 358 and a.ca_hash >= 178 and a.ca_hash <= 928
;
