select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 134 and ss.ss_hash <= 467 and cd.cd_hash >= 83 and cd.cd_hash <= 833 and d.d_hash >= 217 and d.d_hash <= 617
;
