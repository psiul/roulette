select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 1 and ss.ss_hash <= 334 and c.c_hash >= 327 and c.c_hash <= 727 and i.i_hash >= 39 and i.i_hash <= 789
;
