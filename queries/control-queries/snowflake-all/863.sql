select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 229 and hd.hd_hash <= 979 and d.d_hash >= 166 and d.d_hash <= 499 and cd.cd_hash >= 100 and cd.cd_hash <= 500
;
