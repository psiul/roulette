select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 643 and ss.ss_hash <= 976 and c.c_hash >= 524 and c.c_hash <= 924 and cd.cd_hash >= 50 and cd.cd_hash <= 800
;
