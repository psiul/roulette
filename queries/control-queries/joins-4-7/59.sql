select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 146 and d.d_hash <= 546 and i.i_hash >= 218 and i.i_hash <= 551 and cd.cd_hash >= 17 and cd.cd_hash <= 767
;
