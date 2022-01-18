select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 339 and ss.ss_hash <= 739 and d.d_hash >= 34 and d.d_hash <= 367 and a.ca_hash >= 188 and a.ca_hash <= 938
;
