select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 743 and ss.ss_hash <= 843 and d.d_hash >= 173 and d.d_hash <= 373 and c.c_hash >= 401 and c.c_hash <= 901
;
