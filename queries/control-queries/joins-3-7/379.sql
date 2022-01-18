select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 176 and ss.ss_hash <= 576 and cd.cd_hash >= 201 and cd.cd_hash <= 534 and i.i_hash >= 180 and i.i_hash <= 930
;
