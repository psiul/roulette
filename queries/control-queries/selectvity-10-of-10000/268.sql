select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 573 and hd.hd_hash <= 773 and cd.cd_hash >= 804 and cd.cd_hash <= 854 and i.i_hash >= 114 and i.i_hash <= 214
;
