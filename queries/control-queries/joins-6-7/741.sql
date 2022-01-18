select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 93 and c.c_hash <= 426 and hd.hd_hash >= 148 and hd.hd_hash <= 898 and d.d_hash >= 472 and d.d_hash <= 872
;
