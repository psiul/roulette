select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 417 and ss.ss_hash <= 750 and i.i_hash >= 364 and i.i_hash <= 764 and cd.cd_hash >= 67 and cd.cd_hash <= 817
;
