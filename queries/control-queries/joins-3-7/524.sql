select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 185 and ss.ss_hash <= 518 and i.i_hash >= 410 and i.i_hash <= 810 and cd.cd_hash >= 14 and cd.cd_hash <= 764
;
