select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 262 and ss.ss_hash <= 762 and cd.cd_hash >= 592 and cd.cd_hash <= 692 and hd.hd_hash >= 104 and hd.hd_hash <= 304
;
