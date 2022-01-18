select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 202 and ss.ss_hash <= 952 and c.c_hash >= 394 and c.c_hash <= 727 and cd.cd_hash >= 16 and cd.cd_hash <= 416
;
