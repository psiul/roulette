select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 162 and ss.ss_hash <= 495 and hd.hd_hash >= 39 and hd.hd_hash <= 439 and a.ca_hash >= 164 and a.ca_hash <= 914
;
