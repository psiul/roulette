select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 413 and hd.hd_hash <= 513 and cd.cd_hash >= 52 and cd.cd_hash <= 252 and c.c_hash >= 459 and c.c_hash <= 959
;
