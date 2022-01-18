select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 426 and ss.ss_hash <= 826 and cd.cd_hash >= 320 and cd.cd_hash <= 653 and d.d_hash >= 227 and d.d_hash <= 977
;
