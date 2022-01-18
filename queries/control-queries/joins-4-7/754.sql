select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 25 and cd.cd_hash <= 775 and d.d_hash >= 322 and d.d_hash <= 655 and hd.hd_hash >= 484 and hd.hd_hash <= 884
;
