select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 64 and i.i_hash <= 397 and c.c_hash >= 10 and c.c_hash <= 760 and cd.cd_hash >= 359 and cd.cd_hash <= 759
;
