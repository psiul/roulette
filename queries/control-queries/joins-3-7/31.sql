select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 287 and ss.ss_hash <= 620 and i.i_hash >= 110 and i.i_hash <= 860 and cd.cd_hash >= 170 and cd.cd_hash <= 570
;
