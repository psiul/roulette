select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 403 and ss.ss_hash <= 736 and i.i_hash >= 60 and i.i_hash <= 810 and cd.cd_hash >= 339 and cd.cd_hash <= 739
;
