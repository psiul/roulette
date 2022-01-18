select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 264 and ss.ss_hash <= 597 and cd.cd_hash >= 21 and cd.cd_hash <= 771 and i.i_hash >= 205 and i.i_hash <= 605
;
