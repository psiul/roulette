select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 425 and ss.ss_hash <= 825 and cd.cd_hash >= 59 and cd.cd_hash <= 809 and d.d_hash >= 83 and d.d_hash <= 416
;
