select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 470 and ss.ss_hash <= 803 and i.i_hash >= 94 and i.i_hash <= 844 and cd.cd_hash >= 306 and cd.cd_hash <= 706
;
