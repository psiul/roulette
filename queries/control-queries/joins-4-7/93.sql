select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 637 and i.i_hash <= 970 and c.c_hash >= 15 and c.c_hash <= 765 and cd.cd_hash >= 114 and cd.cd_hash <= 514
;
