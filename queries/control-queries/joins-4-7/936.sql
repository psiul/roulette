select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 354 and ss.ss_hash <= 754 and d.d_hash >= 131 and d.d_hash <= 881 and cd.cd_hash >= 595 and cd.cd_hash <= 928
;
