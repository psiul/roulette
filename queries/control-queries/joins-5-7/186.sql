select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 660 and cd.cd_hash <= 993 and hd.hd_hash >= 89 and hd.hd_hash <= 839 and c.c_hash >= 398 and c.c_hash <= 798
;
