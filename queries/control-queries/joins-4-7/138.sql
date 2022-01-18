select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 570 and i.i_hash <= 970 and cd.cd_hash >= 319 and cd.cd_hash <= 652 and d.d_hash >= 79 and d.d_hash <= 829
;
