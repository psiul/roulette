select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 467 and ss.ss_hash <= 567 and i.i_hash >= 454 and i.i_hash <= 474 and cd.cd_hash >= 787 and cd.cd_hash <= 837
;
