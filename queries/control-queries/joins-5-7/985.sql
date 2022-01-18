select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 197 and c.c_hash <= 947 and hd.hd_hash >= 315 and hd.hd_hash <= 648 and cd.cd_hash >= 151 and cd.cd_hash <= 551
;
