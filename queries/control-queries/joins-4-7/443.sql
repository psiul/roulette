select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 115 and ss.ss_hash <= 448 and cd.cd_hash >= 48 and cd.cd_hash <= 798 and i.i_hash >= 2 and i.i_hash <= 402
;
