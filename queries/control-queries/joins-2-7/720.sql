select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 742 and ss.ss_hash <= 942 and cd.cd_hash >= 229 and cd.cd_hash <= 729
;