select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 169 and d.d_hash <= 919 and cd.cd_hash >= 250 and cd.cd_hash <= 650 and c.c_hash >= 81 and c.c_hash <= 414
;
