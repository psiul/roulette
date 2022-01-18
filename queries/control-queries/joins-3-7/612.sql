select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 460 and ss.ss_hash <= 793 and i.i_hash >= 76 and i.i_hash <= 826 and cd.cd_hash >= 535 and cd.cd_hash <= 935
;
