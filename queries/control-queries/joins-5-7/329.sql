select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 289 and ss.ss_hash <= 689 and d.d_hash >= 517 and d.d_hash <= 850 and cd.cd_hash >= 126 and cd.cd_hash <= 876
;
