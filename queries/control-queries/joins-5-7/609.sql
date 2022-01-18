select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 61 and ss.ss_hash <= 811 and cd.cd_hash >= 503 and cd.cd_hash <= 903 and c.c_hash >= 661 and c.c_hash <= 994
;
