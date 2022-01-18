select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 615 and cd.cd_hash <= 948 and i.i_hash >= 81 and i.i_hash <= 831 and c.c_hash >= 87 and c.c_hash <= 487
;
