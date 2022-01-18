select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 191 and ss.ss_hash <= 941 and cd.cd_hash >= 609 and cd.cd_hash <= 942 and i.i_hash >= 336 and i.i_hash <= 736
;
