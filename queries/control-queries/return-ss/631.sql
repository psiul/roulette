select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 435 and i.i_hash <= 835 and a.ca_hash >= 613 and a.ca_hash <= 946 and hd.hd_hash >= 152 and hd.hd_hash <= 902
;
