select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 889 and c.c_hash <= 989 and cd.cd_hash >= 289 and cd.cd_hash <= 489 and hd.hd_hash >= 860 and hd.hd_hash <= 910
;
