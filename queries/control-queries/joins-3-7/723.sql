select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 78 and ss.ss_hash <= 478 and i.i_hash >= 92 and i.i_hash <= 842 and cd.cd_hash >= 397 and cd.cd_hash <= 730
;
