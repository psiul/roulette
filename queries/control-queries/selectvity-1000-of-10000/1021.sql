select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 328 and hd.hd_hash <= 728 and c.c_hash >= 323 and c.c_hash <= 656 and d.d_hash >= 199 and d.d_hash <= 949
;
