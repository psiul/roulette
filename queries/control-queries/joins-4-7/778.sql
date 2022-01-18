select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 312 and ss.ss_hash <= 645 and cd.cd_hash >= 78 and cd.cd_hash <= 828 and d.d_hash >= 126 and d.d_hash <= 526
;
