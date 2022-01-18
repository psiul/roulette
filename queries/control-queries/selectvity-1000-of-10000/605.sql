select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 80 and i.i_hash <= 830 and cd.cd_hash >= 142 and cd.cd_hash <= 542 and c.c_hash >= 291 and c.c_hash <= 624
;
