select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 104 and i.i_hash <= 437 and hd.hd_hash >= 188 and hd.hd_hash <= 588 and cd.cd_hash >= 217 and cd.cd_hash <= 967
;
