select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 240 and ss.ss_hash <= 990 and cd.cd_hash >= 367 and cd.cd_hash <= 767 and i.i_hash >= 32 and i.i_hash <= 365
;
