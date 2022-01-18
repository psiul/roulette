select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 48 and hd.hd_hash <= 448 and a.ca_hash >= 463 and a.ca_hash <= 796 and i.i_hash >= 182 and i.i_hash <= 932
;
