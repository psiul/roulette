select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 90 and ss.ss_hash <= 490 and c.c_hash >= 170 and c.c_hash <= 920 and a.ca_hash >= 61 and a.ca_hash <= 394
;
