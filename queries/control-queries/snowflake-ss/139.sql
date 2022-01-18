select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 43 and ss.ss_hash <= 793 and a.ca_hash >= 393 and a.ca_hash <= 793 and hd.hd_hash >= 539 and hd.hd_hash <= 872
;
