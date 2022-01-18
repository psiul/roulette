select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 72 and c.c_hash <= 172 and a.ca_hash >= 926 and a.ca_hash <= 976 and hd.hd_hash >= 606 and hd.hd_hash <= 626
;
