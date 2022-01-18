select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 49 and i.i_hash <= 382 and a.ca_hash >= 243 and a.ca_hash <= 643 and hd.hd_hash >= 33 and hd.hd_hash <= 783
;
