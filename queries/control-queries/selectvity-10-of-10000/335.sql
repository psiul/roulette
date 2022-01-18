select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 820 and ss.ss_hash <= 920 and hd.hd_hash >= 737 and hd.hd_hash <= 787 and a.ca_hash >= 329 and a.ca_hash <= 529
;
