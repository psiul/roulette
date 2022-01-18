select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 172 and hd.hd_hash <= 505 and cd.cd_hash >= 77 and cd.cd_hash <= 477 and i.i_hash >= 64 and i.i_hash <= 814
;
