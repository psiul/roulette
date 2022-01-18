select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 416 and ss.ss_hash <= 749 and c.c_hash >= 134 and c.c_hash <= 884 and cd.cd_hash >= 562 and cd.cd_hash <= 962
;
