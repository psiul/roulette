select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 952 and ss.ss_hash <= 972 and cd.cd_hash >= 511 and cd.cd_hash <= 561 and c.c_hash >= 467 and c.c_hash <= 567
;
