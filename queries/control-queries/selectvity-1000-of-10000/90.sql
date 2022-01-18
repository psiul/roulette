select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 427 and i.i_hash <= 760 and hd.hd_hash >= 401 and hd.hd_hash <= 801 and cd.cd_hash >= 7 and cd.cd_hash <= 757
;
