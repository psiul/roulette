select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 173 and ss.ss_hash <= 506 and i.i_hash >= 66 and i.i_hash <= 816 and c.c_hash >= 347 and c.c_hash <= 747
;
