select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 259 and ss.ss_hash <= 592 and i.i_hash >= 133 and i.i_hash <= 533 and cd.cd_hash >= 90 and cd.cd_hash <= 840
;
