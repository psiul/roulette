select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 302 and ss.ss_hash <= 635 and i.i_hash >= 246 and i.i_hash <= 996 and cd.cd_hash >= 127 and cd.cd_hash <= 527
;
