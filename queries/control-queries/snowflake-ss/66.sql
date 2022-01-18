select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 215 and ss.ss_hash <= 615 and i.i_hash >= 193 and i.i_hash <= 943 and hd.hd_hash >= 465 and hd.hd_hash <= 798
;
