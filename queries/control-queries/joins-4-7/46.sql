select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 386 and c.c_hash <= 719 and i.i_hash >= 136 and i.i_hash <= 886 and cd.cd_hash >= 511 and cd.cd_hash <= 911
;
