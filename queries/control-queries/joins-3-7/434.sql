select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 534 and ss.ss_hash <= 934 and cd.cd_hash >= 230 and cd.cd_hash <= 980 and d.d_hash >= 28 and d.d_hash <= 361
;
