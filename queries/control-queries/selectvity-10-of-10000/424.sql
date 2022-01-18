select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 93 and ss.ss_hash <= 143 and i.i_hash >= 169 and i.i_hash <= 369 and hd.hd_hash >= 450 and hd.hd_hash <= 550
;
