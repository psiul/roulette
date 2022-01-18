select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 153 and ss.ss_hash <= 903 and hd.hd_hash >= 470 and hd.hd_hash <= 803 and cd.cd_hash >= 72 and cd.cd_hash <= 472
;
