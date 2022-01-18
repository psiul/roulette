select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 165 and hd.hd_hash <= 365 and cd.cd_hash >= 491 and cd.cd_hash <= 591 and d.d_hash >= 313 and d.d_hash <= 363
;
