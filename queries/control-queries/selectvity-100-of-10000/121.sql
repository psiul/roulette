select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 347 and ss.ss_hash <= 847 and hd.hd_hash >= 693 and hd.hd_hash <= 793 and a.ca_hash >= 620 and a.ca_hash <= 820
;
