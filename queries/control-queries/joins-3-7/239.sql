select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 469 and ss.ss_hash <= 802 and cd.cd_hash >= 58 and cd.cd_hash <= 808 and i.i_hash >= 507 and i.i_hash <= 907
;
