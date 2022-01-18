select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 68 and ss.ss_hash <= 818 and c.c_hash >= 245 and c.c_hash <= 578 and cd.cd_hash >= 71 and cd.cd_hash <= 471
;
