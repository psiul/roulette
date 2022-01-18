select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 8 and ss.ss_hash <= 758 and i.i_hash >= 213 and i.i_hash <= 613 and c.c_hash >= 3 and c.c_hash <= 336
;
