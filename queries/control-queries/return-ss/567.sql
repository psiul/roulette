select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 36 and ss.ss_hash <= 786 and i.i_hash >= 318 and i.i_hash <= 718 and c.c_hash >= 400 and c.c_hash <= 733
;
