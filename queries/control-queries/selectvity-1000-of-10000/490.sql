select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 382 and c.c_hash <= 782 and hd.hd_hash >= 119 and hd.hd_hash <= 869 and cd.cd_hash >= 317 and cd.cd_hash <= 650
;
