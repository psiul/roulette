select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 65 and c.c_hash <= 565 and hd.hd_hash >= 86 and hd.hd_hash <= 286 and cd.cd_hash >= 144 and cd.cd_hash <= 244
;
