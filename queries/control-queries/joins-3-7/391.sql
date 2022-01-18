select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 237 and ss.ss_hash <= 987 and c.c_hash >= 472 and c.c_hash <= 872 and cd.cd_hash >= 172 and cd.cd_hash <= 505
;
