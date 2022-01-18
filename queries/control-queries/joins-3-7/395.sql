select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 7 and ss.ss_hash <= 757 and cd.cd_hash >= 635 and cd.cd_hash <= 968 and i.i_hash >= 428 and i.i_hash <= 828
;
