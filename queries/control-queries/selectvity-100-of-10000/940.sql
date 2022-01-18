select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 238 and hd.hd_hash <= 438 and i.i_hash >= 412 and i.i_hash <= 912 and a.ca_hash >= 71 and a.ca_hash <= 171
;
