select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 120 and c.c_hash <= 453 and hd.hd_hash >= 60 and hd.hd_hash <= 810 and cd.cd_hash >= 333 and cd.cd_hash <= 733
;
