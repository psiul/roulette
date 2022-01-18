select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 129 and ss.ss_hash <= 329 and c.c_hash >= 185 and c.c_hash <= 685 and d.d_hash >= 701 and d.d_hash <= 801
;
