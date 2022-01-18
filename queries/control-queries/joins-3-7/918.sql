select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 366 and ss.ss_hash <= 766 and i.i_hash >= 46 and i.i_hash <= 379 and cd.cd_hash >= 121 and cd.cd_hash <= 871
;
