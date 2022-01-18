select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 38 and ss.ss_hash <= 371 and i.i_hash >= 525 and i.i_hash <= 925 and cd.cd_hash >= 34 and cd.cd_hash <= 784
;
