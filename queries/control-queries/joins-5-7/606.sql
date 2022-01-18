select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 39 and hd.hd_hash <= 789 and d.d_hash >= 170 and d.d_hash <= 503 and cd.cd_hash >= 475 and cd.cd_hash <= 875
;
