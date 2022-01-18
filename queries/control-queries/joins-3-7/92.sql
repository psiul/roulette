select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 561 and ss.ss_hash <= 961 and i.i_hash >= 191 and i.i_hash <= 941 and cd.cd_hash >= 583 and cd.cd_hash <= 916
;
