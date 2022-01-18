select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 107 and hd.hd_hash <= 507 and i.i_hash >= 508 and i.i_hash <= 841 and cd.cd_hash >= 38 and cd.cd_hash <= 788
;
