select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 52 and ss.ss_hash <= 802 and c.c_hash >= 579 and c.c_hash <= 979 and a.ca_hash >= 536 and a.ca_hash <= 869
;
