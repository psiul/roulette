select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 31 and ss.ss_hash <= 781 and cd.cd_hash >= 211 and cd.cd_hash <= 544 and i.i_hash >= 26 and i.i_hash <= 426
;
