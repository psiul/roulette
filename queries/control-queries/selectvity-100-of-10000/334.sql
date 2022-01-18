select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 368 and ss.ss_hash <= 468 and cd.cd_hash >= 351 and cd.cd_hash <= 851 and i.i_hash >= 767 and i.i_hash <= 967
;
