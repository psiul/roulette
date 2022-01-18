select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 218 and ss.ss_hash <= 968 and c.c_hash >= 6 and c.c_hash <= 339 and hd.hd_hash >= 454 and hd.hd_hash <= 854
;
