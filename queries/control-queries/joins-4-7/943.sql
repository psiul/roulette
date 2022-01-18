select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 139 and ss.ss_hash <= 472 and cd.cd_hash >= 69 and cd.cd_hash <= 819 and d.d_hash >= 422 and d.d_hash <= 822
;
