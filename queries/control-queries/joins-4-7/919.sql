select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 114 and hd.hd_hash <= 514 and cd.cd_hash >= 216 and cd.cd_hash <= 966 and d.d_hash >= 24 and d.d_hash <= 357
;