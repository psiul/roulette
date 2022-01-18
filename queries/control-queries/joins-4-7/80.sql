select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 130 and c.c_hash <= 880 and i.i_hash >= 95 and i.i_hash <= 495 and cd.cd_hash >= 17 and cd.cd_hash <= 350
;
