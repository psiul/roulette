select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 7 and ss.ss_hash <= 757 and hd.hd_hash >= 295 and hd.hd_hash <= 695 and cd.cd_hash >= 48 and cd.cd_hash <= 381
;
