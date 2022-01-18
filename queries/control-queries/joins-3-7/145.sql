select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 221 and ss.ss_hash <= 971 and cd.cd_hash >= 383 and cd.cd_hash <= 783 and i.i_hash >= 303 and i.i_hash <= 636
;
