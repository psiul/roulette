select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 475 and ss.ss_hash <= 975 and cd.cd_hash >= 772 and cd.cd_hash <= 972
;
