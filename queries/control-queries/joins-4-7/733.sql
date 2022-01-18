select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 105 and d.d_hash <= 438 and cd.cd_hash >= 148 and cd.cd_hash <= 548 and i.i_hash >= 7 and i.i_hash <= 757
;
