select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 42 and ss.ss_hash <= 792 and c.c_hash >= 523 and c.c_hash <= 923 and cd.cd_hash >= 463 and cd.cd_hash <= 796
;
