select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 528 and ss.ss_hash <= 861 and cd.cd_hash >= 159 and cd.cd_hash <= 909 and i.i_hash >= 423 and i.i_hash <= 823
;
