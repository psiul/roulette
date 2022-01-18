select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 497 and ss.ss_hash <= 830 and c.c_hash >= 15 and c.c_hash <= 765 and cd.cd_hash >= 151 and cd.cd_hash <= 551
;
