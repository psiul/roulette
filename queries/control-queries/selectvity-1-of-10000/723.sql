select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 94 and ss.ss_hash <= 144 and i.i_hash >= 829 and i.i_hash <= 849 and hd.hd_hash >= 834 and hd.hd_hash <= 934
;
