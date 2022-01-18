select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 313 and ss.ss_hash <= 333 and i.i_hash >= 463 and i.i_hash <= 563 and cd.cd_hash >= 244 and cd.cd_hash <= 294
;
