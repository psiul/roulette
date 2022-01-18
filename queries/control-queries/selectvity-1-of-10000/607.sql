select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 31 and cd.cd_hash <= 81 and d.d_hash >= 893 and d.d_hash <= 993 and c.c_hash >= 905 and c.c_hash <= 925
;
