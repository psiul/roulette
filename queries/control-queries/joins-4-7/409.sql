select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 195 and ss.ss_hash <= 945 and i.i_hash >= 376 and i.i_hash <= 776 and c.c_hash >= 146 and c.c_hash <= 479
;
