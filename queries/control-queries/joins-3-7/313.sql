select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 176 and ss.ss_hash <= 926 and i.i_hash >= 22 and i.i_hash <= 355 and cd.cd_hash >= 433 and cd.cd_hash <= 833
;
