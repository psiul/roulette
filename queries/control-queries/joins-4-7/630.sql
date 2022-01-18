select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 184 and cd.cd_hash <= 517 and i.i_hash >= 248 and i.i_hash <= 998 and d.d_hash >= 78 and d.d_hash <= 478
;
