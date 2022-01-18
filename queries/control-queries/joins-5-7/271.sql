select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 336 and c.c_hash <= 736 and cd.cd_hash >= 209 and cd.cd_hash <= 959 and d.d_hash >= 517 and d.d_hash <= 850
;
