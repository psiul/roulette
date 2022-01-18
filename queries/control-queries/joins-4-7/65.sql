select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 44 and ss.ss_hash <= 444 and cd.cd_hash >= 28 and cd.cd_hash <= 778 and hd.hd_hash >= 661 and hd.hd_hash <= 994
;
