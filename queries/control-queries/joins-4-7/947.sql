select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 466 and cd.cd_hash <= 866 and hd.hd_hash >= 306 and hd.hd_hash <= 639 and d.d_hash >= 142 and d.d_hash <= 892
;
