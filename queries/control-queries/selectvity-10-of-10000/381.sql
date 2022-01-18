select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 845 and cd.cd_hash <= 945 and hd.hd_hash >= 304 and hd.hd_hash <= 354 and c.c_hash >= 749 and c.c_hash <= 949
;
