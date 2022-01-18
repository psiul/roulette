select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 477 and hd.hd_hash <= 810 and i.i_hash >= 214 and i.i_hash <= 964 and c.c_hash >= 315 and c.c_hash <= 715
;
