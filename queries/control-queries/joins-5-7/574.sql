select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 214 and d.d_hash <= 614 and cd.cd_hash >= 256 and cd.cd_hash <= 589 and c.c_hash >= 60 and c.c_hash <= 810
;
