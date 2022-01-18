select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 73 and ss.ss_hash <= 823 and d.d_hash >= 310 and d.d_hash <= 710 and cd.cd_hash >= 477 and cd.cd_hash <= 810
;
