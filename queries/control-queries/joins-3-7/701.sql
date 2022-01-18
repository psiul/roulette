select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 407 and ss.ss_hash <= 807 and cd.cd_hash >= 382 and cd.cd_hash <= 715 and i.i_hash >= 157 and i.i_hash <= 907
;
