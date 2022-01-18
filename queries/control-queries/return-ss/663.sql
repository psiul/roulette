select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 420 and hd.hd_hash <= 753 and c.c_hash >= 238 and c.c_hash <= 988 and a.ca_hash >= 33 and a.ca_hash <= 433
;
