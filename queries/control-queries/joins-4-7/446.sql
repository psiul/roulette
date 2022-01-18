select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 225 and cd.cd_hash <= 975 and i.i_hash >= 430 and i.i_hash <= 830 and c.c_hash >= 134 and c.c_hash <= 467
;
