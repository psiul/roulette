select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 308 and ss.ss_hash <= 708 and cd.cd_hash >= 16 and cd.cd_hash <= 349 and i.i_hash >= 80 and i.i_hash <= 830
;
