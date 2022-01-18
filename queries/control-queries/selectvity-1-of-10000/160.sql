select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 352 and cd.cd_hash <= 452 and hd.hd_hash >= 861 and hd.hd_hash <= 911 and c.c_hash >= 744 and c.c_hash <= 764
;
