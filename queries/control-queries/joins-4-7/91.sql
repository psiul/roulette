select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 130 and ss.ss_hash <= 880 and i.i_hash >= 390 and i.i_hash <= 790 and cd.cd_hash >= 305 and cd.cd_hash <= 638
;
