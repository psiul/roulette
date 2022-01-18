select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 232 and ss.ss_hash <= 432 and i.i_hash >= 824 and i.i_hash <= 874 and c.c_hash >= 612 and c.c_hash <= 712
;
