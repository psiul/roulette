select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 558 and ss.ss_hash <= 608 and cd.cd_hash >= 564 and cd.cd_hash <= 764 and hd.hd_hash >= 545 and hd.hd_hash <= 645
;
