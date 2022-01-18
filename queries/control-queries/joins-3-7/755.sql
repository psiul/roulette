select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 221 and ss.ss_hash <= 621 and i.i_hash >= 423 and i.i_hash <= 756 and cd.cd_hash >= 107 and cd.cd_hash <= 857
;
