select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 121 and ss.ss_hash <= 871 and i.i_hash >= 568 and i.i_hash <= 901 and cd.cd_hash >= 322 and cd.cd_hash <= 722
;
