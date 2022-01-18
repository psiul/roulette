select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 525 and d.d_hash <= 545 and hd.hd_hash >= 521 and hd.hd_hash <= 571 and c.c_hash >= 438 and c.c_hash <= 538
;
