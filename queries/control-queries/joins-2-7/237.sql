select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 472 and ss.ss_hash <= 672 and cd.cd_hash >= 438 and cd.cd_hash <= 938
;
