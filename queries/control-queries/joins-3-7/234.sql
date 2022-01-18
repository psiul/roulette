select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 476 and ss.ss_hash <= 876 and i.i_hash >= 596 and i.i_hash <= 929 and cd.cd_hash >= 168 and cd.cd_hash <= 918
;
