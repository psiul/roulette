select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 525 and ss.ss_hash <= 925 and i.i_hash >= 196 and i.i_hash <= 946 and cd.cd_hash >= 349 and cd.cd_hash <= 682
;
