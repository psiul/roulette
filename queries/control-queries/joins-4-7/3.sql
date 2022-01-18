select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 181 and c.c_hash <= 514 and cd.cd_hash >= 86 and cd.cd_hash <= 486 and i.i_hash >= 116 and i.i_hash <= 866
;
