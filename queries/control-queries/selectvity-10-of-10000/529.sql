select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 399 and i.i_hash <= 499 and cd.cd_hash >= 512 and cd.cd_hash <= 562 and c.c_hash >= 286 and c.c_hash <= 486
;
