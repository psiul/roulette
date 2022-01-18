select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 464 and ss.ss_hash <= 964 and cd.cd_hash >= 207 and cd.cd_hash <= 407
;
