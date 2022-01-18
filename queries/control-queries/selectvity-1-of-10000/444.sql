select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 551 and cd.cd_hash <= 651 and hd.hd_hash >= 854 and hd.hd_hash <= 874 and i.i_hash >= 532 and i.i_hash <= 582
;
