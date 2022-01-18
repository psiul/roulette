select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 45 and ss.ss_hash <= 445 and hd.hd_hash >= 521 and hd.hd_hash <= 854 and cd.cd_hash >= 52 and cd.cd_hash <= 802
;
