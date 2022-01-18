select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 172 and ss.ss_hash <= 922 and cd.cd_hash >= 291 and cd.cd_hash <= 691 and c.c_hash >= 573 and c.c_hash <= 906
;
