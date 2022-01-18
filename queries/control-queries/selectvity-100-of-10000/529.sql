select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 799 and cd.cd_hash <= 899 and i.i_hash >= 80 and i.i_hash <= 580 and d.d_hash >= 558 and d.d_hash <= 758
;
