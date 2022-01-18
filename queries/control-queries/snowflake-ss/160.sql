select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 56 and ss.ss_hash <= 806 and c.c_hash >= 271 and c.c_hash <= 604 and d.d_hash >= 587 and d.d_hash <= 987
;
