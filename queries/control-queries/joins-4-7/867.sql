select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 177 and d.d_hash <= 927 and cd.cd_hash >= 298 and cd.cd_hash <= 698 and hd.hd_hash >= 126 and hd.hd_hash <= 459
;
