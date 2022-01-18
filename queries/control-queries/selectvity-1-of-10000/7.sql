select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 852 and cd.cd_hash <= 902 and c.c_hash >= 539 and c.c_hash <= 639 and hd.hd_hash >= 582 and hd.hd_hash <= 602
;
