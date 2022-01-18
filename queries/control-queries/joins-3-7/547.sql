select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 74 and ss.ss_hash <= 407 and cd.cd_hash >= 63 and cd.cd_hash <= 813 and i.i_hash >= 80 and i.i_hash <= 480
;
