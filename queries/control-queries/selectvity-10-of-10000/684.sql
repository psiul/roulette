select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 488 and ss.ss_hash <= 588 and c.c_hash >= 286 and c.c_hash <= 486 and hd.hd_hash >= 597 and hd.hd_hash <= 647
;
