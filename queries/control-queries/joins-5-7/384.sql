select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 8 and ss.ss_hash <= 758 and d.d_hash >= 442 and d.d_hash <= 842 and hd.hd_hash >= 227 and hd.hd_hash <= 560
;
