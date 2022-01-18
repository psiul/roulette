select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 154 and ss.ss_hash <= 554 and c.c_hash >= 561 and c.c_hash <= 894 and cd.cd_hash >= 10 and cd.cd_hash <= 760
;
