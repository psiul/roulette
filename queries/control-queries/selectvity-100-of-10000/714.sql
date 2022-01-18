select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 456 and i.i_hash <= 556 and cd.cd_hash >= 380 and cd.cd_hash <= 580 and c.c_hash >= 203 and c.c_hash <= 703
;
