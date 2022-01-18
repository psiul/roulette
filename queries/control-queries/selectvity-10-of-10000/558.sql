select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 100 and hd.hd_hash <= 300 and d.d_hash >= 471 and d.d_hash <= 571 and cd.cd_hash >= 44 and cd.cd_hash <= 94
;
