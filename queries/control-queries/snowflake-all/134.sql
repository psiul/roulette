select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 174 and cd.cd_hash <= 924 and i.i_hash >= 174 and i.i_hash <= 507 and c.c_hash >= 500 and c.c_hash <= 900
;
