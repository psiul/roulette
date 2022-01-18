select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 90 and ss.ss_hash <= 490 and i.i_hash >= 99 and i.i_hash <= 849 and cd.cd_hash >= 364 and cd.cd_hash <= 697
;
