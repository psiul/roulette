select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 785 and ss.ss_hash <= 985 and cd.cd_hash >= 44 and cd.cd_hash <= 544
;
