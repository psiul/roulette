select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 537 and ss.ss_hash <= 637 and i.i_hash >= 76 and i.i_hash <= 126 and a.ca_hash >= 383 and a.ca_hash <= 583
;
