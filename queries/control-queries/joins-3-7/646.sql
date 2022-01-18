select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 598 and ss.ss_hash <= 998 and cd.cd_hash >= 333 and cd.cd_hash <= 666 and i.i_hash >= 71 and i.i_hash <= 821
;
