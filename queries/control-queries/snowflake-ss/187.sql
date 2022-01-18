select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 1 and ss.ss_hash <= 401 and d.d_hash >= 580 and d.d_hash <= 913 and hd.hd_hash >= 132 and hd.hd_hash <= 882
;
