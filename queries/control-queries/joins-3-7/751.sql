select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 200 and ss.ss_hash <= 950 and i.i_hash >= 666 and i.i_hash <= 999 and cd.cd_hash >= 471 and cd.cd_hash <= 871
;
