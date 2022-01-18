select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 42 and ss.ss_hash <= 792 and d.d_hash >= 178 and d.d_hash <= 578 and cd.cd_hash >= 270 and cd.cd_hash <= 603
;
