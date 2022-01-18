select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 344 and hd.hd_hash <= 744 and d.d_hash >= 107 and d.d_hash <= 857 and a.ca_hash >= 321 and a.ca_hash <= 654
;
