select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 191 and ss.ss_hash <= 524 and hd.hd_hash >= 190 and hd.hd_hash <= 940 and d.d_hash >= 479 and d.d_hash <= 879
;
