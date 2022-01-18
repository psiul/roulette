select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 325 and ss.ss_hash <= 725 and c.c_hash >= 419 and c.c_hash <= 752 and cd.cd_hash >= 134 and cd.cd_hash <= 884
;
