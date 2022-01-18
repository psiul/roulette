select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 347 and ss.ss_hash <= 747 and cd.cd_hash >= 79 and cd.cd_hash <= 829 and d.d_hash >= 30 and d.d_hash <= 363
;
