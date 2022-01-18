select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 477 and ss.ss_hash <= 877 and cd.cd_hash >= 8 and cd.cd_hash <= 341 and i.i_hash >= 187 and i.i_hash <= 937
;
