select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 450 and d.d_hash <= 650 and cd.cd_hash >= 496 and cd.cd_hash <= 596 and c.c_hash >= 666 and c.c_hash <= 716
;
