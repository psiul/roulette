select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 296 and i.i_hash <= 696 and cd.cd_hash >= 168 and cd.cd_hash <= 918 and c.c_hash >= 518 and c.c_hash <= 851
;
