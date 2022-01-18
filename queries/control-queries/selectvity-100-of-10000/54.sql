select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 690 and cd.cd_hash <= 790 and i.i_hash >= 635 and i.i_hash <= 835 and hd.hd_hash >= 233 and hd.hd_hash <= 733
;
