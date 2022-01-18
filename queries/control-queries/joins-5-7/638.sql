select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 346 and d.d_hash <= 679 and cd.cd_hash >= 218 and cd.cd_hash <= 968 and i.i_hash >= 408 and i.i_hash <= 808
;
