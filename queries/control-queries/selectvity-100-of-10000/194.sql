select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 208 and c.c_hash <= 708 and hd.hd_hash >= 412 and hd.hd_hash <= 512 and a.ca_hash >= 141 and a.ca_hash <= 341
;
