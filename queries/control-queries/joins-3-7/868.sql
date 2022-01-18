select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 173 and ss.ss_hash <= 573 and i.i_hash >= 651 and i.i_hash <= 984 and cd.cd_hash >= 197 and cd.cd_hash <= 947
;
