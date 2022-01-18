select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 917 and i.i_hash <= 967 and hd.hd_hash >= 267 and hd.hd_hash <= 467 and cd.cd_hash >= 202 and cd.cd_hash <= 302
;
