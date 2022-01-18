select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 156 and ss.ss_hash <= 906 and c.c_hash >= 573 and c.c_hash <= 973 and hd.hd_hash >= 223 and hd.hd_hash <= 556
;
