select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 659 and ss.ss_hash <= 992 and cd.cd_hash >= 240 and cd.cd_hash <= 990 and hd.hd_hash >= 42 and hd.hd_hash <= 442
;
