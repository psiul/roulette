select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 432 and ss.ss_hash <= 832 and c.c_hash >= 468 and c.c_hash <= 801 and i.i_hash >= 248 and i.i_hash <= 998
;
