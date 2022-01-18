select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 426 and hd.hd_hash <= 926 and c.c_hash >= 556 and c.c_hash <= 656 and a.ca_hash >= 352 and a.ca_hash <= 552
;
