select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 40 and ss.ss_hash <= 790 and cd.cd_hash >= 585 and cd.cd_hash <= 985 and c.c_hash >= 183 and c.c_hash <= 516
;
