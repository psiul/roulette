select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 22 and ss.ss_hash <= 422 and c.c_hash >= 214 and c.c_hash <= 964 and a.ca_hash >= 385 and a.ca_hash <= 718
;
