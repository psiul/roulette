select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 360 and ss.ss_hash <= 760 and c.c_hash >= 235 and c.c_hash <= 568 and a.ca_hash >= 145 and a.ca_hash <= 895
;
