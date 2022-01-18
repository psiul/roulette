select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 464 and ss.ss_hash <= 564 and i.i_hash >= 305 and i.i_hash <= 355 and hd.hd_hash >= 405 and hd.hd_hash <= 425
;
