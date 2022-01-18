select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 212 and ss.ss_hash <= 545 and c.c_hash >= 568 and c.c_hash <= 968 and cd.cd_hash >= 135 and cd.cd_hash <= 885
;
