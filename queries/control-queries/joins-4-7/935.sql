select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 68 and ss.ss_hash <= 468 and i.i_hash >= 143 and i.i_hash <= 476 and d.d_hash >= 49 and d.d_hash <= 799
;
