select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 242 and ss.ss_hash <= 992 and i.i_hash >= 541 and i.i_hash <= 874 and cd.cd_hash >= 114 and cd.cd_hash <= 514
;
