select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 580 and i.i_hash <= 980 and c.c_hash >= 582 and c.c_hash <= 915 and cd.cd_hash >= 24 and cd.cd_hash <= 774
;
