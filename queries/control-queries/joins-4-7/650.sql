select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 223 and d.d_hash <= 973 and i.i_hash >= 372 and i.i_hash <= 705 and cd.cd_hash >= 166 and cd.cd_hash <= 566
;
