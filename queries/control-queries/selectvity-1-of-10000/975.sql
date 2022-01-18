select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 365 and ss.ss_hash <= 415 and a.ca_hash >= 22 and a.ca_hash <= 122 and hd.hd_hash >= 942 and hd.hd_hash <= 962
;
