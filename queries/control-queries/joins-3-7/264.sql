select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 240 and ss.ss_hash <= 990 and cd.cd_hash >= 287 and cd.cd_hash <= 687 and i.i_hash >= 369 and i.i_hash <= 702
;
