select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 161 and ss.ss_hash <= 494 and hd.hd_hash >= 75 and hd.hd_hash <= 825 and cd.cd_hash >= 456 and cd.cd_hash <= 856
;
