select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 314 and ss.ss_hash <= 714 and i.i_hash >= 213 and i.i_hash <= 963 and c.c_hash >= 161 and c.c_hash <= 494
;
