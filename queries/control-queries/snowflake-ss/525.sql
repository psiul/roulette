select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 338 and ss.ss_hash <= 671 and hd.hd_hash >= 263 and hd.hd_hash <= 663 and a.ca_hash >= 242 and a.ca_hash <= 992
;
