select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 875 and cd.cd_hash <= 925 and c.c_hash >= 80 and c.c_hash <= 180 and hd.hd_hash >= 664 and hd.hd_hash <= 864
;
