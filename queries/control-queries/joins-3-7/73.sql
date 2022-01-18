select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 23 and ss.ss_hash <= 773 and i.i_hash >= 533 and i.i_hash <= 866 and cd.cd_hash >= 189 and cd.cd_hash <= 589
;
