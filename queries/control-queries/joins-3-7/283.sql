select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 62 and ss.ss_hash <= 812 and i.i_hash >= 341 and i.i_hash <= 674 and cd.cd_hash >= 516 and cd.cd_hash <= 916
;
