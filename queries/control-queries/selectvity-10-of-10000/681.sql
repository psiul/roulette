select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 778 and ss.ss_hash <= 828 and i.i_hash >= 745 and i.i_hash <= 845 and a.ca_hash >= 245 and a.ca_hash <= 445
;
