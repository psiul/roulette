select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 54 and ss.ss_hash <= 804 and i.i_hash >= 212 and i.i_hash <= 612 and d.d_hash >= 20 and d.d_hash <= 353
;
