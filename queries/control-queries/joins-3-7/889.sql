select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 385 and ss.ss_hash <= 785 and i.i_hash >= 52 and i.i_hash <= 802 and cd.cd_hash >= 417 and cd.cd_hash <= 750
;
