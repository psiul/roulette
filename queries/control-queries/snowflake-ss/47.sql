select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 148 and ss.ss_hash <= 481 and c.c_hash >= 54 and c.c_hash <= 804 and a.ca_hash >= 426 and a.ca_hash <= 826
;
