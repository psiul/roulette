select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 363 and ss.ss_hash <= 763 and hd.hd_hash >= 20 and hd.hd_hash <= 770 and a.ca_hash >= 384 and a.ca_hash <= 717
;
