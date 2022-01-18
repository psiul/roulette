select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 802 and hd.hd_hash <= 822 and c.c_hash >= 589 and c.c_hash <= 689 and cd.cd_hash >= 371 and cd.cd_hash <= 421
;
