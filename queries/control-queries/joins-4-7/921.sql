select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 193 and ss.ss_hash <= 526 and cd.cd_hash >= 486 and cd.cd_hash <= 886 and hd.hd_hash >= 41 and hd.hd_hash <= 791
;
