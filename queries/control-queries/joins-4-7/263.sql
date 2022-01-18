select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 53 and ss.ss_hash <= 803 and d.d_hash >= 293 and d.d_hash <= 626 and cd.cd_hash >= 66 and cd.cd_hash <= 466
;
