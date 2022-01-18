select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 246 and ss.ss_hash <= 579 and i.i_hash >= 498 and i.i_hash <= 898 and c.c_hash >= 22 and c.c_hash <= 772
;
