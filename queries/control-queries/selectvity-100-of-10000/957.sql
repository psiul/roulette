select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 131 and d.d_hash <= 631 and i.i_hash >= 345 and i.i_hash <= 545 and cd.cd_hash >= 686 and cd.cd_hash <= 786
;
