select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 294 and ss.ss_hash <= 794 and cd.cd_hash >= 604 and cd.cd_hash <= 804
;
