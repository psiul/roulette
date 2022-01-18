select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 51 and ss.ss_hash <= 801 and c.c_hash >= 361 and c.c_hash <= 694 and i.i_hash >= 494 and i.i_hash <= 894
;
