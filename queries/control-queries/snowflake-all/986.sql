select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 216 and c.c_hash <= 966 and cd.cd_hash >= 301 and cd.cd_hash <= 701 and d.d_hash >= 122 and d.d_hash <= 455
;
