select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 31 and c.c_hash <= 364 and cd.cd_hash >= 171 and cd.cd_hash <= 571 and i.i_hash >= 202 and i.i_hash <= 952
;
