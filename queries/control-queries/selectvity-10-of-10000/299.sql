select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 190 and ss.ss_hash <= 390 and i.i_hash >= 315 and i.i_hash <= 365 and hd.hd_hash >= 776 and hd.hd_hash <= 876
;
