select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 266 and ss.ss_hash <= 286 and hd.hd_hash >= 46 and hd.hd_hash <= 96 and c.c_hash >= 147 and c.c_hash <= 247
;
