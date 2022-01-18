select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 114 and ss.ss_hash <= 864 and cd.cd_hash >= 547 and cd.cd_hash <= 947 and i.i_hash >= 199 and i.i_hash <= 532
;
