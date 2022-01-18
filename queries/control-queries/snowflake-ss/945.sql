select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 177 and ss.ss_hash <= 577 and a.ca_hash >= 439 and a.ca_hash <= 772 and hd.hd_hash >= 138 and hd.hd_hash <= 888
;
