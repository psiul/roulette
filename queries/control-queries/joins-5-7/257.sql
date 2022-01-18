select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 201 and d.d_hash <= 951 and i.i_hash >= 369 and i.i_hash <= 702 and cd.cd_hash >= 360 and cd.cd_hash <= 760
;
