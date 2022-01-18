select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 893 and cd.cd_hash <= 913 and hd.hd_hash >= 508 and hd.hd_hash <= 608 and c.c_hash >= 867 and c.c_hash <= 917
;
