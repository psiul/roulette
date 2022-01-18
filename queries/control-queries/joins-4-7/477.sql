select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 435 and ss.ss_hash <= 835 and cd.cd_hash >= 376 and cd.cd_hash <= 709 and i.i_hash >= 211 and i.i_hash <= 961
;
