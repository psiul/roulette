select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 30 and d.d_hash <= 430 and hd.hd_hash >= 210 and hd.hd_hash <= 960 and cd.cd_hash >= 85 and cd.cd_hash <= 418
;
