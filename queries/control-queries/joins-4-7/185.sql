select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 110 and cd.cd_hash <= 860 and d.d_hash >= 395 and d.d_hash <= 728 and hd.hd_hash >= 250 and hd.hd_hash <= 650
;
