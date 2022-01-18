select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 364 and i.i_hash <= 464 and hd.hd_hash >= 165 and hd.hd_hash <= 215 and cd.cd_hash >= 306 and cd.cd_hash <= 326
;
