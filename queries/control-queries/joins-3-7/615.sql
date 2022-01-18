select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 251 and ss.ss_hash <= 584 and cd.cd_hash >= 557 and cd.cd_hash <= 957 and i.i_hash >= 103 and i.i_hash <= 853
;
