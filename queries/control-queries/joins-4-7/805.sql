select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 466 and ss.ss_hash <= 799 and cd.cd_hash >= 68 and cd.cd_hash <= 818 and hd.hd_hash >= 190 and hd.hd_hash <= 590
;
