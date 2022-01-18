select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 212 and ss.ss_hash <= 312 and d.d_hash >= 148 and d.d_hash <= 168 and cd.cd_hash >= 246 and cd.cd_hash <= 296
;
