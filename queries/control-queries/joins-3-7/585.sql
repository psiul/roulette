select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 335 and ss.ss_hash <= 735 and cd.cd_hash >= 71 and cd.cd_hash <= 404 and i.i_hash >= 150 and i.i_hash <= 900
;
