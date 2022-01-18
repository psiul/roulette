select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 451 and ss.ss_hash <= 851 and cd.cd_hash >= 43 and cd.cd_hash <= 793 and i.i_hash >= 468 and i.i_hash <= 801
;
