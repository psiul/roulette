select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 37 and ss.ss_hash <= 437 and c.c_hash >= 350 and c.c_hash <= 683 and i.i_hash >= 27 and i.i_hash <= 777
;
