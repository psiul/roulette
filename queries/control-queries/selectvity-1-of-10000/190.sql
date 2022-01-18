select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 408 and ss.ss_hash <= 428 and c.c_hash >= 160 and c.c_hash <= 260 and i.i_hash >= 583 and i.i_hash <= 633
;
