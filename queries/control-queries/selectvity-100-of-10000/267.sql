select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 79 and hd.hd_hash <= 579 and cd.cd_hash >= 396 and cd.cd_hash <= 496 and i.i_hash >= 484 and i.i_hash <= 684
;
