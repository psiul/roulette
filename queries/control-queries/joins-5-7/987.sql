select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 74 and i.i_hash <= 824 and a.ca_hash >= 531 and a.ca_hash <= 931 and hd.hd_hash >= 524 and hd.hd_hash <= 857
;
