select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 306 and hd.hd_hash <= 639 and cd.cd_hash >= 449 and cd.cd_hash <= 849 and i.i_hash >= 60 and i.i_hash <= 810
;
