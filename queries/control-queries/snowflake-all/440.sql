select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 132 and ss.ss_hash <= 532 and c.c_hash >= 236 and c.c_hash <= 569 and cd.cd_hash >= 91 and cd.cd_hash <= 841
;
