select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 979 and hd.hd_hash <= 999 and d.d_hash >= 385 and d.d_hash <= 485 and a.ca_hash >= 784 and a.ca_hash <= 834
;
