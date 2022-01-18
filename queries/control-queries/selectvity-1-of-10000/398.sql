select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 193 and ss.ss_hash <= 213 and cd.cd_hash >= 837 and cd.cd_hash <= 937 and hd.hd_hash >= 388 and hd.hd_hash <= 438
;
