select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 84 and ss.ss_hash <= 417 and cd.cd_hash >= 18 and cd.cd_hash <= 768 and i.i_hash >= 95 and i.i_hash <= 495
;
