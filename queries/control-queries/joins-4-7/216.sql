select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 137 and i.i_hash <= 887 and c.c_hash >= 158 and c.c_hash <= 558 and cd.cd_hash >= 91 and cd.cd_hash <= 424
;
