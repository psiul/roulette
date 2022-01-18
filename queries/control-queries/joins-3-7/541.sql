select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 494 and ss.ss_hash <= 894 and d.d_hash >= 271 and d.d_hash <= 604 and cd.cd_hash >= 218 and cd.cd_hash <= 968
;
