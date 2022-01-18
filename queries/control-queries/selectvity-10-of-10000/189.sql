select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 302 and ss.ss_hash <= 502 and cd.cd_hash >= 879 and cd.cd_hash <= 929 and i.i_hash >= 394 and i.i_hash <= 494
;
