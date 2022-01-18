select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 230 and ss.ss_hash <= 630 and i.i_hash >= 337 and i.i_hash <= 670 and cd.cd_hash >= 55 and cd.cd_hash <= 805
;
