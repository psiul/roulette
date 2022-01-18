select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 179 and ss.ss_hash <= 579 and cd.cd_hash >= 306 and cd.cd_hash <= 639 and d.d_hash >= 248 and d.d_hash <= 998
;
