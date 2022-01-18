select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 33 and c.c_hash <= 783 and cd.cd_hash >= 376 and cd.cd_hash <= 776 and i.i_hash >= 455 and i.i_hash <= 788
;
