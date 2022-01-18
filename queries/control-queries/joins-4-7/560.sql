select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 596 and cd.cd_hash <= 929 and c.c_hash >= 240 and c.c_hash <= 640 and i.i_hash >= 48 and i.i_hash <= 798
;
