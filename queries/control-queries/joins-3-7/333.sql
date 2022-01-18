select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 57 and ss.ss_hash <= 807 and cd.cd_hash >= 192 and cd.cd_hash <= 592 and i.i_hash >= 141 and i.i_hash <= 474
;
