select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 754 and c.c_hash <= 854 and cd.cd_hash >= 776 and cd.cd_hash <= 826 and d.d_hash >= 454 and d.d_hash <= 474
;
