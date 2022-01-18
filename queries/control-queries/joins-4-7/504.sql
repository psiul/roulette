select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 1 and i.i_hash <= 751 and c.c_hash >= 384 and c.c_hash <= 784 and cd.cd_hash >= 391 and cd.cd_hash <= 724
;
