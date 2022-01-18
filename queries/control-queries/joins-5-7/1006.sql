select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 249 and ss.ss_hash <= 649 and c.c_hash >= 165 and c.c_hash <= 915 and hd.hd_hash >= 218 and hd.hd_hash <= 551
;
