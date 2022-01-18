select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 281 and ss.ss_hash <= 681 and c.c_hash >= 228 and c.c_hash <= 561 and cd.cd_hash >= 177 and cd.cd_hash <= 927
;
