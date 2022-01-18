select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 553 and ss.ss_hash <= 953 and i.i_hash >= 170 and i.i_hash <= 920 and cd.cd_hash >= 82 and cd.cd_hash <= 415
;
