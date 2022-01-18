select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 55 and i.i_hash <= 455 and hd.hd_hash >= 86 and hd.hd_hash <= 836 and a.ca_hash >= 330 and a.ca_hash <= 663
;
