select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 370 and i.i_hash <= 703 and cd.cd_hash >= 188 and cd.cd_hash <= 938 and c.c_hash >= 519 and c.c_hash <= 919
;
