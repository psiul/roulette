select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 126 and ss.ss_hash <= 526 and d.d_hash >= 51 and d.d_hash <= 801 and cd.cd_hash >= 287 and cd.cd_hash <= 620
;
