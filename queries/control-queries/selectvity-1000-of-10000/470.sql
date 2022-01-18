select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 63 and i.i_hash <= 396 and hd.hd_hash >= 303 and hd.hd_hash <= 703 and cd.cd_hash >= 9 and cd.cd_hash <= 759
;
