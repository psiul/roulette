select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 622 and ss.ss_hash <= 955 and d.d_hash >= 341 and d.d_hash <= 741 and a.ca_hash >= 24 and a.ca_hash <= 774
;
