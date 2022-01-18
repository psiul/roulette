select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 372 and ss.ss_hash <= 772 and i.i_hash >= 207 and i.i_hash <= 957 and cd.cd_hash >= 209 and cd.cd_hash <= 542
;
