select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 371 and ss.ss_hash <= 704 and i.i_hash >= 216 and i.i_hash <= 966 and cd.cd_hash >= 580 and cd.cd_hash <= 980
;
