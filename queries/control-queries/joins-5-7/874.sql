select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 435 and ss.ss_hash <= 835 and c.c_hash >= 542 and c.c_hash <= 875 and a.ca_hash >= 196 and a.ca_hash <= 946
;
