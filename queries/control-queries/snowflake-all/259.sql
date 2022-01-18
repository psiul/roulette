select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 158 and c.c_hash <= 558 and a.ca_hash >= 227 and a.ca_hash <= 977 and i.i_hash >= 600 and i.i_hash <= 933
;
