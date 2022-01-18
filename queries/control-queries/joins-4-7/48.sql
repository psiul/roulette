select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 55 and ss.ss_hash <= 805 and cd.cd_hash >= 350 and cd.cd_hash <= 683 and i.i_hash >= 46 and i.i_hash <= 446
;
