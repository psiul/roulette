select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 605 and ss.ss_hash <= 938 and cd.cd_hash >= 343 and cd.cd_hash <= 743 and d.d_hash >= 141 and d.d_hash <= 891
;
