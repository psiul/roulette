select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 630 and ss.ss_hash <= 680 and c.c_hash >= 595 and c.c_hash <= 695 and hd.hd_hash >= 634 and hd.hd_hash <= 654
;
