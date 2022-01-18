select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 278 and ss.ss_hash <= 778 and cd.cd_hash >= 677 and cd.cd_hash <= 877
;
