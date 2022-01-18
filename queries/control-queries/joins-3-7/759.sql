select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 600 and ss.ss_hash <= 933 and d.d_hash >= 208 and d.d_hash <= 958 and cd.cd_hash >= 266 and cd.cd_hash <= 666
;
