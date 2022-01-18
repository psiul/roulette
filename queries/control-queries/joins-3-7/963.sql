select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 180 and ss.ss_hash <= 513 and cd.cd_hash >= 227 and cd.cd_hash <= 977 and i.i_hash >= 148 and i.i_hash <= 548
;
