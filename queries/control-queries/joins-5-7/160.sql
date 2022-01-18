select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 204 and c.c_hash <= 954 and i.i_hash >= 244 and i.i_hash <= 644 and a.ca_hash >= 76 and a.ca_hash <= 409
;
