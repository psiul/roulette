select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 99 and ss.ss_hash <= 499 and i.i_hash >= 517 and i.i_hash <= 850 and cd.cd_hash >= 237 and cd.cd_hash <= 987
;
