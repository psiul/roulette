select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 379 and hd.hd_hash <= 429 and i.i_hash >= 890 and i.i_hash <= 990 and cd.cd_hash >= 269 and cd.cd_hash <= 289
;
