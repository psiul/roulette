select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 238 and cd.cd_hash <= 638 and c.c_hash >= 117 and c.c_hash <= 867 and i.i_hash >= 307 and i.i_hash <= 640
;
