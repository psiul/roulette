select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 436 and ss.ss_hash <= 836 and cd.cd_hash >= 164 and cd.cd_hash <= 914 and c.c_hash >= 585 and c.c_hash <= 918
;
