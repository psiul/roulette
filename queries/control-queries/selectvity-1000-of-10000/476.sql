select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 410 and ss.ss_hash <= 743 and i.i_hash >= 117 and i.i_hash <= 867 and cd.cd_hash >= 79 and cd.cd_hash <= 479
;
