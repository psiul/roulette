select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 59 and ss.ss_hash <= 392 and i.i_hash >= 12 and i.i_hash <= 412 and cd.cd_hash >= 165 and cd.cd_hash <= 915
;
