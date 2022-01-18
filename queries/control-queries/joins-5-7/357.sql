select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 193 and hd.hd_hash <= 943 and i.i_hash >= 468 and i.i_hash <= 801 and cd.cd_hash >= 78 and cd.cd_hash <= 478
;
