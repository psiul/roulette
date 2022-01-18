select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 408 and ss.ss_hash <= 908 and hd.hd_hash >= 784 and hd.hd_hash <= 984 and c.c_hash >= 461 and c.c_hash <= 561
;
