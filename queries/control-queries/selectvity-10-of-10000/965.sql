select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 330 and cd.cd_hash <= 430 and i.i_hash >= 3 and i.i_hash <= 203 and hd.hd_hash >= 457 and hd.hd_hash <= 507
;
