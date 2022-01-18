select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 47 and ss.ss_hash <= 247 and d.d_hash >= 263 and d.d_hash <= 363 and cd.cd_hash >= 131 and cd.cd_hash <= 181
;
