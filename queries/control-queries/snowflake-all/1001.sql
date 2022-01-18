select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 120 and ss.ss_hash <= 870 and i.i_hash >= 310 and i.i_hash <= 643 and hd.hd_hash >= 391 and hd.hd_hash <= 791
;
