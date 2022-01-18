select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 136 and ss.ss_hash <= 886 and c.c_hash >= 176 and c.c_hash <= 509 and cd.cd_hash >= 312 and cd.cd_hash <= 712
;
