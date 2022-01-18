select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 206 and ss.ss_hash <= 956 and i.i_hash >= 154 and i.i_hash <= 554 and c.c_hash >= 213 and c.c_hash <= 546
;
