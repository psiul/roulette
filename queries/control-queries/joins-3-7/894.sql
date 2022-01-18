select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 209 and ss.ss_hash <= 959 and cd.cd_hash >= 401 and cd.cd_hash <= 801 and i.i_hash >= 490 and i.i_hash <= 823
;
