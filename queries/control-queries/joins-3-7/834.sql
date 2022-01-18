select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 12 and ss.ss_hash <= 412 and i.i_hash >= 184 and i.i_hash <= 934 and cd.cd_hash >= 295 and cd.cd_hash <= 628
;
