select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 422 and ss.ss_hash <= 755 and c.c_hash >= 2 and c.c_hash <= 752 and cd.cd_hash >= 566 and cd.cd_hash <= 966
;
