select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 69 and ss.ss_hash <= 402 and a.ca_hash >= 206 and a.ca_hash <= 606 and hd.hd_hash >= 17 and hd.hd_hash <= 767
;
