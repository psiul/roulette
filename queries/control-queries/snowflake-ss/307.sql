select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 21 and ss.ss_hash <= 771 and cd.cd_hash >= 20 and cd.cd_hash <= 353 and c.c_hash >= 221 and c.c_hash <= 621
;
