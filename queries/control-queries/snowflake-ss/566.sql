select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 435 and ss.ss_hash <= 768 and c.c_hash >= 94 and c.c_hash <= 494 and d.d_hash >= 4 and d.d_hash <= 754
;
