select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 343 and cd.cd_hash <= 743 and c.c_hash >= 67 and c.c_hash <= 817 and i.i_hash >= 56 and i.i_hash <= 389
;
