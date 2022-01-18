select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 341 and ss.ss_hash <= 541 and i.i_hash >= 10 and i.i_hash <= 510 and cd.cd_hash >= 94 and cd.cd_hash <= 194
;
