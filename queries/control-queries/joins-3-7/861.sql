select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 159 and ss.ss_hash <= 492 and cd.cd_hash >= 166 and cd.cd_hash <= 916 and d.d_hash >= 4 and d.d_hash <= 404
;
