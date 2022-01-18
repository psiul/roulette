select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 137 and ss.ss_hash <= 887 and c.c_hash >= 30 and c.c_hash <= 430 and a.ca_hash >= 148 and a.ca_hash <= 481
;
