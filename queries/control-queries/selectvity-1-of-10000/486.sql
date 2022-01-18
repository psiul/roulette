select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 506 and d.d_hash <= 606 and i.i_hash >= 456 and i.i_hash <= 476 and cd.cd_hash >= 163 and cd.cd_hash <= 213
;
