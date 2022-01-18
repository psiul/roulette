select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 267 and ss.ss_hash <= 600 and i.i_hash >= 6 and i.i_hash <= 406 and c.c_hash >= 225 and c.c_hash <= 975
;
