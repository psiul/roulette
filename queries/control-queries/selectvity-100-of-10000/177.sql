select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 479 and ss.ss_hash <= 679 and cd.cd_hash >= 397 and cd.cd_hash <= 497 and d.d_hash >= 420 and d.d_hash <= 920
;
