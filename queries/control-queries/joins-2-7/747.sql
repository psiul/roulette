select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 468 and ss.ss_hash <= 968 and cd.cd_hash >= 797 and cd.cd_hash <= 997
;
