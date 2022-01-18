select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 142 and ss.ss_hash <= 542 and cd.cd_hash >= 230 and cd.cd_hash <= 980 and d.d_hash >= 510 and d.d_hash <= 843
;
