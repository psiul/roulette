select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 223 and ss.ss_hash <= 973 and cd.cd_hash >= 609 and cd.cd_hash <= 942 and i.i_hash >= 520 and i.i_hash <= 920
;
