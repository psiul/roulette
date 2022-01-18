select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 217 and c.c_hash <= 967 and a.ca_hash >= 71 and a.ca_hash <= 404 and d.d_hash >= 28 and d.d_hash <= 428
;
