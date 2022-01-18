select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 451 and ss.ss_hash <= 851 and c.c_hash >= 39 and c.c_hash <= 789 and i.i_hash >= 302 and i.i_hash <= 635
;
