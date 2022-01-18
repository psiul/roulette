select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,date_dim d,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 174 and ss.ss_hash <= 924 and c.c_hash >= 222 and c.c_hash <= 555 and d.d_hash >= 327 and d.d_hash <= 727
;
