select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 468 and cd.cd_hash <= 868 and c.c_hash >= 304 and c.c_hash <= 637 and d.d_hash >= 159 and d.d_hash <= 909
;
