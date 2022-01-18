select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 14 and ss.ss_hash <= 764 and cd.cd_hash >= 321 and cd.cd_hash <= 721 and i.i_hash >= 272 and i.i_hash <= 605
;
