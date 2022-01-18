select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 376 and c.c_hash <= 776 and hd.hd_hash >= 188 and hd.hd_hash <= 521 and a.ca_hash >= 155 and a.ca_hash <= 905
;
