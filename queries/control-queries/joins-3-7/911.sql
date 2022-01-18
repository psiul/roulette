select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 214 and ss.ss_hash <= 964 and cd.cd_hash >= 477 and cd.cd_hash <= 877 and i.i_hash >= 524 and i.i_hash <= 857
;
