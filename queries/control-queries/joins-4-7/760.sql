select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 382 and ss.ss_hash <= 715 and c.c_hash >= 81 and c.c_hash <= 481 and i.i_hash >= 163 and i.i_hash <= 913
;
