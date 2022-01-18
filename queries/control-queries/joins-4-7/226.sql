select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 174 and ss.ss_hash <= 924 and cd.cd_hash >= 333 and cd.cd_hash <= 666 and d.d_hash >= 534 and d.d_hash <= 934
;
