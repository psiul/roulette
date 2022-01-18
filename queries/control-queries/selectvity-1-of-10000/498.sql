select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 514 and c.c_hash <= 614 and i.i_hash >= 510 and i.i_hash <= 530 and a.ca_hash >= 275 and a.ca_hash <= 325
;
