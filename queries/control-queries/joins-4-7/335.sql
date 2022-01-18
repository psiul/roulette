select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 145 and ss.ss_hash <= 478 and i.i_hash >= 183 and i.i_hash <= 933 and cd.cd_hash >= 276 and cd.cd_hash <= 676
;
