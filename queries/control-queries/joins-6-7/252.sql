select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and a.ca_hash >= 70 and a.ca_hash <= 403 and d.d_hash >= 213 and d.d_hash <= 963 and hd.hd_hash >= 545 and hd.hd_hash <= 945
;
