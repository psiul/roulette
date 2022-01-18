select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 10 and ss.ss_hash <= 410 and i.i_hash >= 169 and i.i_hash <= 919 and cd.cd_hash >= 385 and cd.cd_hash <= 718
;
