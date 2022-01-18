select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 246 and ss.ss_hash <= 996 and hd.hd_hash >= 505 and hd.hd_hash <= 838 and c.c_hash >= 181 and c.c_hash <= 581
;
