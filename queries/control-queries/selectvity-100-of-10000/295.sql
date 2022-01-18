select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 244 and ss.ss_hash <= 744 and c.c_hash >= 359 and c.c_hash <= 559 and cd.cd_hash >= 870 and cd.cd_hash <= 970
;
