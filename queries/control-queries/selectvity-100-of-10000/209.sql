select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 77 and ss.ss_hash <= 577 and c.c_hash >= 616 and c.c_hash <= 716 and a.ca_hash >= 196 and a.ca_hash <= 396
;
