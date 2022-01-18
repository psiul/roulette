select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 295 and ss.ss_hash <= 795 and cd.cd_hash >= 579 and cd.cd_hash <= 779
;
