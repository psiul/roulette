select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 111 and ss.ss_hash <= 861 and i.i_hash >= 489 and i.i_hash <= 822 and c.c_hash >= 422 and c.c_hash <= 822
;
