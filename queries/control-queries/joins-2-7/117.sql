select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 358 and ss.ss_hash <= 858 and cd.cd_hash >= 126 and cd.cd_hash <= 326
;
