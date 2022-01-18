select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 156 and ss.ss_hash <= 556 and hd.hd_hash >= 84 and hd.hd_hash <= 834 and a.ca_hash >= 648 and a.ca_hash <= 981
;
