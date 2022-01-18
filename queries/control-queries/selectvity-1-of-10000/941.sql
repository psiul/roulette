select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 476 and cd.cd_hash <= 496 and i.i_hash >= 383 and i.i_hash <= 483 and hd.hd_hash >= 698 and hd.hd_hash <= 748
;
