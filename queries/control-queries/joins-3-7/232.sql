select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 463 and ss.ss_hash <= 863 and i.i_hash >= 622 and i.i_hash <= 955 and cd.cd_hash >= 247 and cd.cd_hash <= 997
;
