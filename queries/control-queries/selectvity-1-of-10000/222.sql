select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 378 and ss.ss_hash <= 428 and cd.cd_hash >= 10 and cd.cd_hash <= 110 and i.i_hash >= 655 and i.i_hash <= 675
;
