select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 133 and ss.ss_hash <= 883 and i.i_hash >= 97 and i.i_hash <= 430 and c.c_hash >= 516 and c.c_hash <= 916
;
