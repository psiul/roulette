select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 325 and ss.ss_hash <= 725 and c.c_hash >= 109 and c.c_hash <= 859 and d.d_hash >= 181 and d.d_hash <= 514
;
