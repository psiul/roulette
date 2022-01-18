select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 88 and ss.ss_hash <= 421 and i.i_hash >= 54 and i.i_hash <= 454 and cd.cd_hash >= 143 and cd.cd_hash <= 893
;
