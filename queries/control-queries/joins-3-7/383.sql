select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 173 and ss.ss_hash <= 506 and i.i_hash >= 167 and i.i_hash <= 917 and cd.cd_hash >= 305 and cd.cd_hash <= 705
;
