select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 130 and c.c_hash <= 530 and a.ca_hash >= 143 and a.ca_hash <= 893 and hd.hd_hash >= 438 and hd.hd_hash <= 771
;
