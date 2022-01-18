select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 409 and ss.ss_hash <= 809 and cd.cd_hash >= 652 and cd.cd_hash <= 985 and i.i_hash >= 109 and i.i_hash <= 859
;
