select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 188 and ss.ss_hash <= 588 and cd.cd_hash >= 57 and cd.cd_hash <= 807 and i.i_hash >= 335 and i.i_hash <= 668
;
