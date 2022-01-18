select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 383 and ss.ss_hash <= 783 and i.i_hash >= 328 and i.i_hash <= 661 and a.ca_hash >= 30 and a.ca_hash <= 780
;
