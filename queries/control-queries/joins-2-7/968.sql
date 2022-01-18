select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 280 and ss.ss_hash <= 780 and cd.cd_hash >= 113 and cd.cd_hash <= 313
;
