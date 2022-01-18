select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 313 and hd.hd_hash <= 363 and i.i_hash >= 616 and i.i_hash <= 716 and c.c_hash >= 133 and c.c_hash <= 153
;
