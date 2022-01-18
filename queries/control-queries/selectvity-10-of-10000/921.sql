select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 12 and ss.ss_hash <= 62 and cd.cd_hash >= 628 and cd.cd_hash <= 728 and hd.hd_hash >= 552 and hd.hd_hash <= 752
;
