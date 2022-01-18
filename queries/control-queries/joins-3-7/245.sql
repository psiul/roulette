select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 430 and ss.ss_hash <= 763 and i.i_hash >= 236 and i.i_hash <= 636 and cd.cd_hash >= 64 and cd.cd_hash <= 814
;
