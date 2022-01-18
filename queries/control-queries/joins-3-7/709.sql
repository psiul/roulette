select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 75 and ss.ss_hash <= 825 and cd.cd_hash >= 92 and cd.cd_hash <= 492 and i.i_hash >= 201 and i.i_hash <= 534
;
