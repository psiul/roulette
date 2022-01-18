select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 156 and ss.ss_hash <= 906 and i.i_hash >= 533 and i.i_hash <= 933 and cd.cd_hash >= 240 and cd.cd_hash <= 573
;
