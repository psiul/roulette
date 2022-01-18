select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 26 and ss.ss_hash <= 426 and cd.cd_hash >= 388 and cd.cd_hash <= 721 and i.i_hash >= 169 and i.i_hash <= 919
;
