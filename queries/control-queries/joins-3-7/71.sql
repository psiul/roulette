select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 98 and ss.ss_hash <= 848 and i.i_hash >= 413 and i.i_hash <= 813 and cd.cd_hash >= 123 and cd.cd_hash <= 456
;
