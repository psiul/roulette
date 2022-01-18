select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 411 and ss.ss_hash <= 811 and c.c_hash >= 137 and c.c_hash <= 887 and cd.cd_hash >= 537 and cd.cd_hash <= 870
;
