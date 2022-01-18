select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 120 and ss.ss_hash <= 520 and i.i_hash >= 411 and i.i_hash <= 744 and c.c_hash >= 44 and c.c_hash <= 794
;
