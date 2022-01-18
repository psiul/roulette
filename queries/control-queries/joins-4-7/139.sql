select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 240 and ss.ss_hash <= 640 and cd.cd_hash >= 586 and cd.cd_hash <= 919 and hd.hd_hash >= 64 and hd.hd_hash <= 814
;
