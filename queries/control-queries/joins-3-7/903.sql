select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 485 and ss.ss_hash <= 818 and i.i_hash >= 70 and i.i_hash <= 820 and cd.cd_hash >= 343 and cd.cd_hash <= 743
;
