select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 170 and ss.ss_hash <= 920 and hd.hd_hash >= 233 and hd.hd_hash <= 633 and cd.cd_hash >= 439 and cd.cd_hash <= 772
;
