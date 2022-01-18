select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 136 and cd.cd_hash <= 469 and i.i_hash >= 168 and i.i_hash <= 918 and c.c_hash >= 314 and c.c_hash <= 714
;
