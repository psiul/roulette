select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 406 and d.d_hash <= 426 and c.c_hash >= 431 and c.c_hash <= 531 and hd.hd_hash >= 780 and hd.hd_hash <= 830
;
