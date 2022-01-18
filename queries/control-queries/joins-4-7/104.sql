select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 43 and ss.ss_hash <= 793 and i.i_hash >= 141 and i.i_hash <= 541 and cd.cd_hash >= 246 and cd.cd_hash <= 579
;
