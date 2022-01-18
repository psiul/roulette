select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 42 and ss.ss_hash <= 792 and hd.hd_hash >= 154 and hd.hd_hash <= 487 and i.i_hash >= 580 and i.i_hash <= 980
;
