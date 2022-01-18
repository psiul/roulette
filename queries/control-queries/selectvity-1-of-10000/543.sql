select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 882 and ss.ss_hash <= 902 and a.ca_hash >= 443 and a.ca_hash <= 493 and i.i_hash >= 355 and i.i_hash <= 455
;
