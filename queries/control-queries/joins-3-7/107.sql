select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 656 and ss.ss_hash <= 989 and cd.cd_hash >= 127 and cd.cd_hash <= 877 and i.i_hash >= 144 and i.i_hash <= 544
;
