select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 669 and i.i_hash <= 719 and d.d_hash >= 476 and d.d_hash <= 576 and cd.cd_hash >= 418 and cd.cd_hash <= 618
;
