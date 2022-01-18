select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 218 and i.i_hash <= 551 and cd.cd_hash >= 175 and cd.cd_hash <= 925 and c.c_hash >= 65 and c.c_hash <= 465
;
