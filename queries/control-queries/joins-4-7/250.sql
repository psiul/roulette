select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 58 and d.d_hash <= 391 and hd.hd_hash >= 82 and hd.hd_hash <= 832 and cd.cd_hash >= 334 and cd.cd_hash <= 734
;
