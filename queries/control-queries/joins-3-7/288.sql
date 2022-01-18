select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 137 and ss.ss_hash <= 887 and cd.cd_hash >= 18 and cd.cd_hash <= 418 and i.i_hash >= 429 and i.i_hash <= 762
;
