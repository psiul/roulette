select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 121 and ss.ss_hash <= 221 and c.c_hash >= 306 and c.c_hash <= 806 and i.i_hash >= 196 and i.i_hash <= 396
;
