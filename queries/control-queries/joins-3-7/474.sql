select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 625 and ss.ss_hash <= 958 and d.d_hash >= 194 and d.d_hash <= 594 and cd.cd_hash >= 210 and cd.cd_hash <= 960
;
