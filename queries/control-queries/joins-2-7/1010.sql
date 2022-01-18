select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 373 and ss.ss_hash <= 573 and cd.cd_hash >= 437 and cd.cd_hash <= 937
;
