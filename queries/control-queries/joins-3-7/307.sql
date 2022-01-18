select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 186 and ss.ss_hash <= 936 and i.i_hash >= 498 and i.i_hash <= 898 and cd.cd_hash >= 38 and cd.cd_hash <= 371
;
