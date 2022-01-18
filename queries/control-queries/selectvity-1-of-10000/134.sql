select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 197 and c.c_hash <= 297 and hd.hd_hash >= 686 and hd.hd_hash <= 736 and d.d_hash >= 82 and d.d_hash <= 102
;
