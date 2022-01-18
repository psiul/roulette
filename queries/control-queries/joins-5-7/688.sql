select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 218 and d.d_hash <= 551 and c.c_hash >= 8 and c.c_hash <= 758 and cd.cd_hash >= 34 and cd.cd_hash <= 434
;
