select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 74 and hd.hd_hash <= 824 and c.c_hash >= 420 and c.c_hash <= 820 and cd.cd_hash >= 511 and cd.cd_hash <= 844
;
