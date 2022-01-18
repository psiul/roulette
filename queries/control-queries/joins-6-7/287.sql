select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_demographics cd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 223 and ss.ss_hash <= 623 and d.d_hash >= 603 and d.d_hash <= 936 and c.c_hash >= 9 and c.c_hash <= 759
;
