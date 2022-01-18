select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 51 and ss.ss_hash <= 551 and cd.cd_hash >= 199 and cd.cd_hash <= 399
;
