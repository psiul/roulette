select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 887 and c.c_hash <= 987 and d.d_hash >= 399 and d.d_hash <= 899 and a.ca_hash >= 251 and a.ca_hash <= 451
;
