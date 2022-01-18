select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 157 and ss.ss_hash <= 257 and a.ca_hash >= 152 and a.ca_hash <= 652 and hd.hd_hash >= 597 and hd.hd_hash <= 797
;
