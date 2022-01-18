select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 429 and ss.ss_hash <= 929 and c.c_hash >= 335 and c.c_hash <= 435 and d.d_hash >= 319 and d.d_hash <= 519
;
