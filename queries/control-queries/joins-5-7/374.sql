select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 312 and i.i_hash <= 712 and c.c_hash >= 240 and c.c_hash <= 573 and a.ca_hash >= 154 and a.ca_hash <= 904
;
