select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 216 and ss.ss_hash <= 966 and cd.cd_hash >= 374 and cd.cd_hash <= 707 and c.c_hash >= 418 and c.c_hash <= 818
;