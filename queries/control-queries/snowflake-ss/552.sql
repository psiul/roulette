select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 190 and c.c_hash <= 940 and hd.hd_hash >= 158 and hd.hd_hash <= 491 and cd.cd_hash >= 112 and cd.cd_hash <= 512
;
