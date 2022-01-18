select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 761 and c.c_hash <= 861 and a.ca_hash >= 933 and a.ca_hash <= 983 and i.i_hash >= 356 and i.i_hash <= 556
;
