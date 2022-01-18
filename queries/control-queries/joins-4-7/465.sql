select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 14 and ss.ss_hash <= 414 and c.c_hash >= 269 and c.c_hash <= 602 and cd.cd_hash >= 215 and cd.cd_hash <= 965
;
