select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 471 and i.i_hash <= 971 and hd.hd_hash >= 676 and hd.hd_hash <= 776 and a.ca_hash >= 118 and a.ca_hash <= 318
;
