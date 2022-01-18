select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 11 and i.i_hash <= 511 and hd.hd_hash >= 752 and hd.hd_hash <= 852 and cd.cd_hash >= 249 and cd.cd_hash <= 449
;
