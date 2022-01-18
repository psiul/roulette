select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 170 and hd.hd_hash <= 920 and c.c_hash >= 125 and c.c_hash <= 525 and a.ca_hash >= 116 and a.ca_hash <= 449
;
