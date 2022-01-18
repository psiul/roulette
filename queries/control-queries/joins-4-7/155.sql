select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 73 and ss.ss_hash <= 823 and cd.cd_hash >= 56 and cd.cd_hash <= 456 and c.c_hash >= 605 and c.c_hash <= 938
;
