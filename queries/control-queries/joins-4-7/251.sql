select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 247 and ss.ss_hash <= 997 and i.i_hash >= 22 and i.i_hash <= 355 and cd.cd_hash >= 164 and cd.cd_hash <= 564
;
