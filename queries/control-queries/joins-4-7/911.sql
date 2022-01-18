select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 614 and ss.ss_hash <= 947 and c.c_hash >= 554 and c.c_hash <= 954 and i.i_hash >= 142 and i.i_hash <= 892
;
