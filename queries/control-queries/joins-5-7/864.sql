select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 30 and i.i_hash <= 363 and cd.cd_hash >= 139 and cd.cd_hash <= 539 and c.c_hash >= 171 and c.c_hash <= 921
;
