select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 242 and ss.ss_hash <= 742 and cd.cd_hash >= 416 and cd.cd_hash <= 616
;
