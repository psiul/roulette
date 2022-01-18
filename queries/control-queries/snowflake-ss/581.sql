select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 93 and ss.ss_hash <= 426 and cd.cd_hash >= 9 and cd.cd_hash <= 409 and i.i_hash >= 190 and i.i_hash <= 940
;
