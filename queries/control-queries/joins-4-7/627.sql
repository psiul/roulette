select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 216 and ss.ss_hash <= 549 and cd.cd_hash >= 121 and cd.cd_hash <= 521 and i.i_hash >= 192 and i.i_hash <= 942
;
