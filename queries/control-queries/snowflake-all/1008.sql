select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 505 and ss.ss_hash <= 905 and cd.cd_hash >= 208 and cd.cd_hash <= 958 and i.i_hash >= 142 and i.i_hash <= 475
;
