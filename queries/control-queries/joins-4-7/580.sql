select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 237 and ss.ss_hash <= 987 and i.i_hash >= 171 and i.i_hash <= 504 and d.d_hash >= 172 and d.d_hash <= 572
;
