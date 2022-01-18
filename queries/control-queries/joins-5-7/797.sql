select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 174 and i.i_hash <= 507 and cd.cd_hash >= 517 and cd.cd_hash <= 917 and hd.hd_hash >= 232 and hd.hd_hash <= 982
;
