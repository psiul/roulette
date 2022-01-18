select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 14 and ss.ss_hash <= 414 and cd.cd_hash >= 632 and cd.cd_hash <= 965 and c.c_hash >= 145 and c.c_hash <= 895
;
