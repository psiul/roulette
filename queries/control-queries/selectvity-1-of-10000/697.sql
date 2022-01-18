select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 680 and ss.ss_hash <= 780 and cd.cd_hash >= 48 and cd.cd_hash <= 68 and c.c_hash >= 533 and c.c_hash <= 583
;
