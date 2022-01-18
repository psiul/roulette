select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 650 and c.c_hash <= 983 and cd.cd_hash >= 257 and cd.cd_hash <= 657 and i.i_hash >= 15 and i.i_hash <= 765
;
