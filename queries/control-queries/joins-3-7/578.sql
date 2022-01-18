select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 347 and ss.ss_hash <= 747 and i.i_hash >= 225 and i.i_hash <= 975 and cd.cd_hash >= 230 and cd.cd_hash <= 563
;
