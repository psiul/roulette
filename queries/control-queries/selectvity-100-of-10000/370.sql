select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 567 and ss.ss_hash <= 767 and a.ca_hash >= 317 and a.ca_hash <= 817 and hd.hd_hash >= 453 and hd.hd_hash <= 553
;
