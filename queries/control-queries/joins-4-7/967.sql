select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 28 and cd.cd_hash <= 428 and d.d_hash >= 53 and d.d_hash <= 803 and i.i_hash >= 178 and i.i_hash <= 511
;
