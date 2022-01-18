select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 349 and cd.cd_hash <= 682 and i.i_hash >= 129 and i.i_hash <= 529 and c.c_hash >= 245 and c.c_hash <= 995
;
