select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 259 and ss.ss_hash <= 659 and cd.cd_hash >= 273 and cd.cd_hash <= 606 and i.i_hash >= 203 and i.i_hash <= 953
;
