select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 48 and ss.ss_hash <= 448 and i.i_hash >= 599 and i.i_hash <= 932 and cd.cd_hash >= 216 and cd.cd_hash <= 966
;
