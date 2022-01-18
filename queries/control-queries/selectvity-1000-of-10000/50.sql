select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 334 and ss.ss_hash <= 667 and i.i_hash >= 81 and i.i_hash <= 831 and a.ca_hash >= 310 and a.ca_hash <= 710
;
