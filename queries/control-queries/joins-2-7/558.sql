select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 135 and ss.ss_hash <= 335 and cd.cd_hash >= 312 and cd.cd_hash <= 812
;
