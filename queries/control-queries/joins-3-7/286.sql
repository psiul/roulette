select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 475 and ss.ss_hash <= 875 and cd.cd_hash >= 239 and cd.cd_hash <= 989 and i.i_hash >= 175 and i.i_hash <= 508
;
