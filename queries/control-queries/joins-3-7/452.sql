select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 23 and ss.ss_hash <= 773 and cd.cd_hash >= 414 and cd.cd_hash <= 814 and d.d_hash >= 136 and d.d_hash <= 469
;
