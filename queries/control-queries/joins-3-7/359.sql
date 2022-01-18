select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 0 and ss.ss_hash <= 333 and cd.cd_hash >= 91 and cd.cd_hash <= 841 and i.i_hash >= 592 and i.i_hash <= 992
;
