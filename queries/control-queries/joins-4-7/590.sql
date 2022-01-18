select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 564 and ss.ss_hash <= 897 and d.d_hash >= 15 and d.d_hash <= 765 and cd.cd_hash >= 290 and cd.cd_hash <= 690
;
