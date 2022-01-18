select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 409 and ss.ss_hash <= 742 and d.d_hash >= 49 and d.d_hash <= 799 and cd.cd_hash >= 56 and cd.cd_hash <= 456
;
