select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 140 and ss.ss_hash <= 473 and cd.cd_hash >= 570 and cd.cd_hash <= 970 and i.i_hash >= 111 and i.i_hash <= 861
;
