select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 780 and ss.ss_hash <= 980 and cd.cd_hash >= 888 and cd.cd_hash <= 988 and hd.hd_hash >= 389 and hd.hd_hash <= 889
;
