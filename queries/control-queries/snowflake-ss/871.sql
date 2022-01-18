select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 346 and c.c_hash <= 746 and a.ca_hash >= 468 and a.ca_hash <= 801 and i.i_hash >= 142 and i.i_hash <= 892
;
