select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 586 and ss.ss_hash <= 986 and cd.cd_hash >= 117 and cd.cd_hash <= 867 and d.d_hash >= 499 and d.d_hash <= 832
;
