select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 110 and ss.ss_hash <= 210 and hd.hd_hash >= 330 and hd.hd_hash <= 380 and i.i_hash >= 480 and i.i_hash <= 500
;
