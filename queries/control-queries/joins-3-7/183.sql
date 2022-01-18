select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 551 and ss.ss_hash <= 884 and i.i_hash >= 128 and i.i_hash <= 878 and cd.cd_hash >= 482 and cd.cd_hash <= 882
;
