select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 153 and ss.ss_hash <= 486 and i.i_hash >= 399 and i.i_hash <= 799 and c.c_hash >= 141 and c.c_hash <= 891
;
