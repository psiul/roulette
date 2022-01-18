select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 213 and i.i_hash <= 713 and c.c_hash >= 650 and c.c_hash <= 850 and a.ca_hash >= 406 and a.ca_hash <= 506
;
